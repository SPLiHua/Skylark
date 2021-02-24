using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Threading;
using UnityEditor;

namespace Skylark.Editor
{
    public class TableExporter
    {
        private static bool IsLinuxSystem()
        {
            PlatformID platformID = System.Environment.OSVersion.Platform;
            if (platformID == PlatformID.MacOSX || platformID == PlatformID.Unix)
            {
                return true;
            }

            return false;
        }

        [MenuItem("Assets/Skylark/Table/Build C#")]
        public static void BuildCSharpFile()
        {
            string path = ProjectPathConfig.projectToolsFolder;
            if (IsLinuxSystem())
            {
                path += ProjectPathConfig.buildCSharpLinuxShell;
            }
            else
            {
                path += ProjectPathConfig.buildCSharpWinShell;
            }

            Thread newThread = new Thread(new ThreadStart(() =>
            {
                BuildCSharpThreadStart(path);
            }));
            newThread.Start();
        }

        [MenuItem("Assets/Skylark/Table/Build Data(txt)")]
        public static void BuildDataTextMode()
        {
            string path = ProjectPathConfig.projectToolsFolder;
            if (IsLinuxSystem())
            {
                path += ProjectPathConfig.buildTxtDataLinuxShell;
            }
            else
            {
                path += ProjectPathConfig.buildTxtDataWinShell;
            }

            Thread newThread = new Thread(new ThreadStart(() =>
            {
                BuildCSharpThreadStart(path);
            }));
            newThread.Start();
        }

        private static void BuildCSharpThreadStart(string path)
        {
            if (IsLinuxSystem())
            {
                CommandThreadStartLinux(path);
            }
            else
            {
                CommandThreadStartWin(path);
            }
        }

        private static void CommandThreadStartLinux(string path)
        {
            Process process = new Process();
            process.StartInfo.FileName = "/bin/sh";
            process.StartInfo.CreateNoWindow = false;
            process.StartInfo.ErrorDialog = true;
            process.StartInfo.UseShellExecute = false;
            process.StartInfo.RedirectStandardOutput = true;
            process.StartInfo.RedirectStandardInput = true;
            process.StartInfo.RedirectStandardError = true;
            process.StartInfo.Arguments = path + " arg1 arg2";

            process.Start();
            string outPutstr = process.StandardOutput.ReadToEnd();
            if (!string.IsNullOrEmpty(outPutstr))
            {
                Log.I(outPutstr);
            }

            process.WaitForExit();
            process.Close();
        }

        private static void CommandThreadStartWin(string path)
        {
            Process process = new Process();
            process.StartInfo.FileName = path;
            process.StartInfo.CreateNoWindow = false;
            process.StartInfo.ErrorDialog = true;
            process.StartInfo.UseShellExecute = false;
            process.StartInfo.RedirectStandardOutput = true;

            process.Start();
            string outPutstr = process.StandardOutput.ReadToEnd();
            if (!string.IsNullOrEmpty(outPutstr))
            {
                Log.I(outPutstr);
            }

            process.WaitForExit();
            process.Close();

            string content;
            DirectoryInfo root = new DirectoryInfo(UnityEngine.Application.streamingAssetsPath + "/config");
            FileInfo[] files = root.GetFiles();
            foreach (var item in files)
            {
                if (item.FullName.Contains("meta"))
                {
                    continue;
                }

                using (StreamReader sr = item.OpenText())
                {
                    content = sr.ReadToEnd();
                    content = EncryptUtil.AesStr(content, SaveSetting.m_AESKeyValue, SaveSetting.m_AESIvValue);
                    sr.Close();
                }
                using (FileStream fs = item.OpenWrite())
                {
                    fs.SetLength(0);
                    byte[] writeDataArray = System.Text.UTF8Encoding.UTF8.GetBytes(content);
                    fs.Write(writeDataArray, 0, writeDataArray.Length);
                    fs.Flush();
                }
            }
        }
    }
}