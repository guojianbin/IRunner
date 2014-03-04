using System;
using MSScriptControl;
using System.Text;

namespace JavaScriptBeautify
{

        /// <summary>
        /// �ű�����
        /// </summary>
        public enum ScriptLanguage
        {
            /// <summary>
            /// JScript�ű�����
            /// </summary>
            JScript,
            /// <summary>
            /// VBscript�ű�����
            /// </summary>
            VBscript,
            /// <summary>
            /// JavaScript�ű�����
            /// </summary>
            JavaScript
        }
        /// <summary>
        /// �ű����д������
        /// </summary>
        public delegate void RunErrorHandler();
        /// <summary>
        /// �ű����г�ʱ����
        /// </summary>
        public delegate void RunTimeoutHandler();
        /// <summary>
        /// ScriptEngine��
        /// </summary>
        public class ScriptEngine
        {
            private ScriptControl msc;
            //����ű����д����¼�
            public event RunErrorHandler RunError;
            //����ű����г�ʱ�¼�
            public event RunTimeoutHandler RunTimeout;
            /// <summary>
            ///���캯��
            /// </summary>
            public ScriptEngine()
                : this(ScriptLanguage.VBscript)
            {
            }
            /// <summary>
            /// ���캯��
            /// </summary>
            /// <param name="language">�ű�����</param>
            public ScriptEngine(ScriptLanguage language)
            {
                this.msc = new ScriptControlClass();
                this.msc.UseSafeSubset = true;
                this.msc.Language = language.ToString();
                ((DScriptControlSource_Event)this.msc).Error += new DScriptControlSource_ErrorEventHandler(ScriptEngine_Error);
                ((DScriptControlSource_Event)this.msc).Timeout += new DScriptControlSource_TimeoutEventHandler(ScriptEngine_Timeout);
            }
            /// <summary>
            /// ����Eval����
            /// </summary>
            /// <param name="expression">���ʽ</param>
            /// <param name="codeBody">������</param>
            /// <returns>����ֵobject</returns>
            public object Eval(string expression, string codeBody)
            {
                msc.AddCode(codeBody);
                return msc.Eval(expression);
            }
            /// <summary>
            /// ����Eval����
            /// </summary>
            /// <param name="language">�ű�����</param>
            /// <param name="expression">���ʽ</param>
            /// <param name="codeBody">������</param>
            /// <returns>����ֵobject</returns>
            public object Eval(ScriptLanguage language, string expression, string codeBody)
            {
                if (this.Language != language)
                    this.Language = language;
                return Eval(expression, codeBody);
            }
            /// <summary>
            /// ����Run����
            /// </summary>
            /// <param name="mainFunctionName">��ں�������</param>
            /// <param name="parameters">����</param>
            /// <param name="codeBody">������</param>
            /// <returns>����ֵobject</returns>
            public object Run(string mainFunctionName, object[] parameters, string codeBody)
            {
                this.msc.AddCode(codeBody);
                return msc.Run(mainFunctionName, ref parameters);
            }
            /// <summary>
            /// ����Run����
            /// </summary>
            /// <param name="language">�ű�����</param>
            /// <param name="mainFunctionName">��ں�������</param>
            /// <param name="parameters">����</param>
            /// <param name="codeBody">������</param>
            /// <returns>����ֵobject</returns>
            public object Run(ScriptLanguage language, string mainFunctionName, object[] parameters, string codeBody)
            {
                if (this.Language != language)
                    this.Language = language;
                return Run(mainFunctionName, parameters, codeBody);
            }
            /// <summary>
            /// ���������Ѿ���ӵ� ScriptControl �е� Script ����Ͷ���
            /// </summary>
            public void Reset()
            {
                this.msc.Reset();
            }
            /// <summary>
            /// ��ȡ�����ýű�����
            /// </summary>
            public ScriptLanguage Language
            {
                get { return (ScriptLanguage)Enum.Parse(typeof(ScriptLanguage), this.msc.Language, false); }
                set { this.msc.Language = value.ToString(); }
            }
            /// <summary>
            /// ��ȡ�����ýű�ִ��ʱ�䣬��λΪ����
            /// </summary>
            //public int Timeout
            //{
            //    get { return this.msc.Timeout; }
            //    set { this.msc.Timeout = value; }
            //}
            /// <summary>
            /// �����Ƿ���ʾ�û�����Ԫ��
            /// </summary>
            public bool AllowUI
            {
                get { return this.msc.AllowUI; }
                set { this.msc.AllowUI = value; }
            }
            /// <summary>
            /// ����Ӧ�ó����Ƿ��б�����Ҫ��
            /// </summary>
            public bool UseSafeSubset
            {
                get { return this.msc.UseSafeSubset; }
                set { this.msc.UseSafeSubset = true; }
            }
            /// <summary>
            /// RunError�¼�����
            /// </summary>
            private void OnError()
            {
                if (RunError != null)
                    RunError();
            }
            /// <summary>
            /// OnTimeout�¼�����
            /// </summary>
            private void OnTimeout()
            {
                if (RunTimeout != null)
                    RunTimeout();
            }
            private void ScriptEngine_Error()
            {
                OnError();
            }
            private void ScriptEngine_Timeout()
            {
                OnTimeout();
            }
        }

    
}
