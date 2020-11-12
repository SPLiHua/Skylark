using ParFsm = Skylark.IFsm<Skylark.IProcedureManager>;

namespace Skylark
{
    public class ProcedureBase : FsmState<IProcedureManager>
    {
        protected internal override void OnInit(ParFsm parFsm)
        {
            base.OnInit(parFsm);
        }

        protected internal override void OnEnter(params object[] param)
        {
            base.OnEnter();
        }

        protected internal override void OnUpdate(float elapseSeconds, float realElapseSeconds)
        {
            base.OnUpdate(elapseSeconds, realElapseSeconds);
        }

        protected internal override void OnLeave(bool isShutdown)
        {
            base.OnLeave(isShutdown);
        }

        protected internal override void OnDestroy()
        {
            base.OnDestroy();
        }
    }
}