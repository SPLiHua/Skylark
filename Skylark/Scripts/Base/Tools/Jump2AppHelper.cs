using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using UnityEngine;

namespace Skylark
{
    public class Jump2AppHelper
    {
        /// <summary>
        /// 跳转到应用商店
        /// </summary>
        public static void OpenAPPinMarket(string appid)
        {

#if UNITY_ANDROID
            //init AndroidJavaClass
            AndroidJavaClass UnityPlayer = new AndroidJavaClass("com.unity3d.player.UnityPlayer"); ;
            AndroidJavaClass Intent = new AndroidJavaClass("android.content.Intent");
            AndroidJavaClass Uri = new AndroidJavaClass("android.net.Uri");

            // get currentActivity
            AndroidJavaObject currentActivity = UnityPlayer.GetStatic<AndroidJavaObject>("currentActivity");

            AndroidJavaObject jstr_content = new AndroidJavaObject("java.lang.String", "market://details?id=" + appid);

            AndroidJavaObject intent = new AndroidJavaObject("android.content.Intent", Intent.GetStatic<AndroidJavaObject>("ACTION_VIEW"), Uri.CallStatic<AndroidJavaObject>("parse", jstr_content));

            currentActivity.Call("startActivity", intent);
#endif
        }

        /// <summary>
        /// 跳转到facebook
        /// </summary>
        private void OpenFacebook()
        {
            if (JudgeHaveApp("com.facebook.katana"))
                Application.OpenURL("fb://page/331347397603096/");
            else
                Application.OpenURL("https://www.facebook.com/deliciousio");
        }

        /// <summary>
        /// 判断手机是否有该app
        /// </summary>
        private bool JudgeHaveApp(string pageName)
        {
            AndroidJavaClass up = new AndroidJavaClass("com.unity3d.player.UnityPlayer");
            AndroidJavaObject ca = up.GetStatic<AndroidJavaObject>("currentActivity");
            AndroidJavaObject packageManager = ca.Call<AndroidJavaObject>("getPackageManager");
            AndroidJavaObject appList = packageManager.Call<AndroidJavaObject>("getInstalledPackages", 0);
            int num = appList.Call<int>("size");
            for (int i = 0; i < num; i++)
            {
                AndroidJavaObject appInfo = appList.Call<AndroidJavaObject>("get", i);
                string packageNew = appInfo.Get<string>("packageName");
                if (packageNew.CompareTo(pageName) == 0)
                {
                    return true;
                }
            }
            return false;
        }
    }

    public class SendEmailHelper
    {
        public static void SendEmail(string subject, string body)
        {
            MailMessage mail = new MailMessage();

            //替换邮箱地址,需要开通邮箱的 smtp 服务
            mail.From = new MailAddress("420418819@qq.com");
            mail.To.Add("420418819@qq.com");
            mail.Subject = subject;
            mail.Body = body;
            //mail.Attachments.Add(new Attachment("screen.png"));

            SmtpClient smtpServer = new SmtpClient("smtp.qq.com");
            smtpServer.Credentials = new System.Net.NetworkCredential("420418819@qq.com", "rvcdmyfrfonebhie") as ICredentialsByHost;
            smtpServer.EnableSsl = true;
            ServicePointManager.ServerCertificateValidationCallback =
                delegate (object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
                { return true; };

            smtpServer.Send(mail);
            Log.I("send email success");
        }
    }
}