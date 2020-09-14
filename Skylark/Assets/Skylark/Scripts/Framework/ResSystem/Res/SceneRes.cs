using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class SceneRes : AssetRes
    {
        public new static SceneRes Allocate(string name)
        {
            SceneRes res = ObjectPool<SceneRes>.S.Allocate();
            if (res != null)
            {
                res.AssetName = name;
                res.InitAssetBundleName();
            }
            return res;
        }

        public SceneRes(string name) : base(name)
        {

        }

        public SceneRes()
        {

        }


        public override bool LoadSync()
        {
            if (!CheckLoadAble())
            {
                return false;
            }

            if (string.IsNullOrEmpty(assetBundleName))
            {
                return false;
            }

            AssetBundleRes abR = ResMgr.S.GetRes<AssetBundleRes>(assetBundleName);

            if (abR == null || abR.assetBundle == null)
            {
                return false;
            }

            State = ResState.Ready;
            return true;
        }

        public override void LoadAsync()
        {
            LoadSync();
        }

        public override void Recycle2Cache()
        {
            ObjectPool<SceneRes>.S.Recycle(this);
        }
    }
}