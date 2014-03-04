using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
namespace IRunner
{
    public class ConvertHelper
    {
        #region ת������Ϊƴ������ĸ
        /// <summary> ת��һ�����ֵ���ƴ������ĸ��ɵ��ַ���
        /// </summary>
        /// <param name="strChinese">��������ַ���</param>
        /// <returns>string</returns>
        /*  ���ã�
            IceCommonTools.ConvertTo.ChineseFirstSpell("���ǵ�����");
         */
        public static string ToChineseFirstSpell(string strChinese)
        {

            int len = strChinese.Length;

            string strResult = "";

            for (int i = 0; i < len; i++)
            { strResult += SpellFirstChinese(strChinese.Substring(i, 1)); }

            return strResult;
        }
        private static string SpellFirstChinese(string strOneChinese)
        {

            byte[] arrCN = Encoding.Default.GetBytes(strOneChinese);

            if (arrCN.Length > 1)
            {
                int area = (short)arrCN[0];
                int pos = (short)arrCN[1];
                int code = (area << 8) + pos;
                int[] areacode = { 45217, 45253, 45761, 46318, 46826, 47010, 47297, 47614, 48119, 48119, 49062, 49324, 49896, 50371, 50614, 50622, 50906, 51387, 51446, 52218, 52698, 52698, 52698, 52980, 53689, 54481 };

                for (int i = 0; i < 26; i++)
                {
                    int max = 55290;

                    if (i != 25) max = areacode[i + 1];

                    if (areacode[i] <= code && code < max)
                    { return Encoding.Default.GetString(new byte[] { (byte)(65 + i) }); }
                }

                return "";
            }
            else
                return strOneChinese;
        }

        /// <summary> 
        /// ȡ�����ַ���ƴ����ĸ 
        /// </summary> 
        /// <param name="c">Ҫת���ĵ�������</param> 
        /// <returns>ƴ����ĸ</returns> 
        public static string GetPYChar(string c)
        {
            byte[] array = new byte[2];
            array = System.Text.Encoding.Default.GetBytes(c);
            int i = (short)(array[0] - '\0') * 256 + ((short)(array[1] - '\0'));
            if (i < 0xB0A1) return "*";
            if (i < 0xB0C5) return "A";
            if (i < 0xB2C1) return "B";
            if (i < 0xB4EE) return "C";
            if (i < 0xB6EA) return "D";
            if (i < 0xB7A2) return "E";
            if (i < 0xB8C1) return "F";
            if (i < 0xB9FE) return "G";
            if (i < 0xBBF7) return "H";
            if (i < 0xBFA6) return "G";
            if (i < 0xC0AC) return "K";
            if (i < 0xC2E8) return "L";
            if (i < 0xC4C3) return "M";
            if (i < 0xC5B6) return "N";
            if (i < 0xC5BE) return "O";
            if (i < 0xC6DA) return "P";
            if (i < 0xC8BB) return "Q";
            if (i < 0xC8F6) return "R";
            if (i < 0xCBFA) return "S";
            if (i < 0xCDDA) return "T";
            if (i < 0xCEF4) return "W";
            if (i < 0xD1B9) return "X";
            if (i < 0xD4D1) return "Y";
            if (i < 0xD7FA) return "Z";
            return "*";
        }
        #endregion

        #region ת������Ϊƴ��
        private static int[] pyvalue = new int[]{-20319,-20317,-20304,-20295,-20292,-20283,-20265,-20257,-20242,-20230,-20051,-20036,-20032,-20026,      
                -20002,-19990,-19986,-19982,-19976,-19805,-19784,-19775,-19774,-19763,-19756,-19751,-19746,-19741,-19739,-19728,      
                -19725,-19715,-19540,-19531,-19525,-19515,-19500,-19484,-19479,-19467,-19289,-19288,-19281,-19275,-19270,-19263,      
                -19261,-19249,-19243,-19242,-19238,-19235,-19227,-19224,-19218,-19212,-19038,-19023,-19018,-19006,-19003,-18996,      
                -18977,-18961,-18952,-18783,-18774,-18773,-18763,-18756,-18741,-18735,-18731,-18722,-18710,-18697,-18696,-18526,      
                -18518,-18501,-18490,-18478,-18463,-18448,-18447,-18446,-18239,-18237,-18231,-18220,-18211,-18201,-18184,-18183,      
                -18181,-18012,-17997,-17988,-17970,-17964,-17961,-17950,-17947,-17931,-17928,-17922,-17759,-17752,-17733,-17730,      
                -17721,-17703,-17701,-17697,-17692,-17683,-17676,-17496,-17487,-17482,-17468,-17454,-17433,-17427,-17417,-17202,      
                -17185,-16983,-16970,-16942,-16915,-16733,-16708,-16706,-16689,-16664,-16657,-16647,-16474,-16470,-16465,-16459,      
                -16452,-16448,-16433,-16429,-16427,-16423,-16419,-16412,-16407,-16403,-16401,-16393,-16220,-16216,-16212,-16205,      
                -16202,-16187,-16180,-16171,-16169,-16158,-16155,-15959,-15958,-15944,-15933,-15920,-15915,-15903,-15889,-15878,      
                -15707,-15701,-15681,-15667,-15661,-15659,-15652,-15640,-15631,-15625,-15454,-15448,-15436,-15435,-15419,-15416,      
                -15408,-15394,-15385,-15377,-15375,-15369,-15363,-15362,-15183,-15180,-15165,-15158,-15153,-15150,-15149,-15144,      
                -15143,-15141,-15140,-15139,-15128,-15121,-15119,-15117,-15110,-15109,-14941,-14937,-14933,-14930,-14929,-14928,      
                -14926,-14922,-14921,-14914,-14908,-14902,-14894,-14889,-14882,-14873,-14871,-14857,-14678,-14674,-14670,-14668,      
                -14663,-14654,-14645,-14630,-14594,-14429,-14407,-14399,-14384,-14379,-14368,-14355,-14353,-14345,-14170,-14159,      
                -14151,-14149,-14145,-14140,-14137,-14135,-14125,-14123,-14122,-14112,-14109,-14099,-14097,-14094,-14092,-14090,      
                -14087,-14083,-13917,-13914,-13910,-13907,-13906,-13905,-13896,-13894,-13878,-13870,-13859,-13847,-13831,-13658,      
                -13611,-13601,-13406,-13404,-13400,-13398,-13395,-13391,-13387,-13383,-13367,-13359,-13356,-13343,-13340,-13329,      
                -13326,-13318,-13147,-13138,-13120,-13107,-13096,-13095,-13091,-13076,-13068,-13063,-13060,-12888,-12875,-12871,      
                -12860,-12858,-12852,-12849,-12838,-12831,-12829,-12812,-12802,-12607,-12597,-12594,-12585,-12556,-12359,-12346,      
                -12320,-12300,-12120,-12099,-12089,-12074,-12067,-12058,-12039,-11867,-11861,-11847,-11831,-11798,-11781,-11604,      
                -11589,-11536,-11358,-11340,-11339,-11324,-11303,-11097,-11077,-11067,-11055,-11052,-11045,-11041,-11038,-11024,      
                -11020,-11019,-11018,-11014,-10838,-10832,-10815,-10800,-10790,-10780,-10764,-10587,-10544,-10533,-10519,-10331,      
                -10329,-10328,-10322,-10315,-10309,-10307,-10296,-10281,-10274,-10270,-10262,-10260,-10256,-10254
    };

        private static string[] pystr = new string[]{"A","Ai","An","Ang","Ao","Ba","Bai","Ban","Bang","Bao","Bei","Ben","Beng","Bi","Bian","Biao",       
            "Bie","Bin","Bing","Bo","Bu","Ca","Cai","Can","Cang","Cao","Ce","Ceng","Cha","Chai","Chan","Chang","Chao","Che","Chen",      
            "Cheng","Chi","Chong","Chou","Chu","Chuai","Chuan","Chuang","Chui","Chun","Chuo","Ci","Cong","Cou","Cu","Cuan","Cui",      
            "Cun","Cuo","Da","Dai","Dan","Dang","Dao","De","Deng","Di","Dian","Diao","Die","Ding","Diu","Dong","Dou","Du","Duan",      
            "Dui","Dun","Duo","E","En","Er","Fa","Fan","Fang","Fei","Fen","Feng","Fo","Fou","Fu","Ga","Gai","Gan","Gang","Gao",      
            "Ge","Gei","Gen","Geng","Gong","Gou","Gu","Gua","Guai","Guan","Guang","Gui","Gun","Guo","Ha","Hai","Han","Hang",      
            "Hao","He","Hei","Hen","Heng","Hong","Hou","Hu","Hua","Huai","Huan","Huang","Hui","Hun","Huo","Ji","Jia","Jian",      
            "Jiang","Jiao","Jie","Jin","Jing","Jiong","Jiu","Ju","Juan","Jue","Jun","Ka","Kai","Kan","Kang","Kao","Ke","Ken",      
            "Keng","Kong","Kou","Ku","Kua","Kuai","Kuan","Kuang","Kui","Kun","Kuo","La","Lai","Lan","Lang","Lao","Le","Lei",      
            "Leng","Li","Lia","Lian","Liang","Liao","Lie","Lin","Ling","Liu","Long","Lou","Lu","Lv","Luan","Lue","Lun","Luo",      
            "Ma","Mai","Man","Mang","Mao","Me","Mei","Men","Meng","Mi","Mian","Miao","Mie","Min","Ming","Miu","Mo","Mou","Mu",      
            "Na","Nai","Nan","Nang","Nao","Ne","Nei","Nen","Neng","Ni","Nian","Niang","Niao","Nie","Nin","Ning","Niu","Nong",      
            "Nu","Nv","Nuan","Nue","Nuo","O","Ou","Pa","Pai","Pan","Pang","Pao","Pei","Pen","Peng","Pi","Pian","Piao","Pie",      
            "Pin","Ping","Po","Pu","Qi","Qia","Qian","Qiang","Qiao","Qie","Qin","Qing","Qiong","Qiu","Qu","Quan","Que","Qun",      
            "Ran","Rang","Rao","Re","Ren","Reng","Ri","Rong","Rou","Ru","Ruan","Rui","Run","Ruo","Sa","Sai","San","Sang",      
            "Sao","Se","Sen","Seng","Sha","Shai","Shan","Shang","Shao","She","Shen","Sheng","Shi","Shou","Shu","Shua",      
            "Shuai","Shuan","Shuang","Shui","Shun","Shuo","Si","Song","Sou","Su","Suan","Sui","Sun","Suo","Ta","Tai",      
            "Tan","Tang","Tao","Te","Teng","Ti","Tian","Tiao","Tie","Ting","Tong","Tou","Tu","Tuan","Tui","Tun","Tuo",       
            "Wa","Wai","Wan","Wang","Wei","Wen","Weng","Wo","Wu","Xi","Xia","Xian","Xiang","Xiao","Xie","Xin","Xing",       
            "Xiong","Xiu","Xu","Xuan","Xue","Xun","Ya","Yan","Yang","Yao","Ye","Yi","Yin","Ying","Yo","Yong","You",       
            "Yu","Yuan","Yue","Yun","Za","Zai","Zan","Zang","Zao","Ze","Zei","Zen","Zeng","Zha","Zhai","Zhan","Zhang",      
            "Zhao","Zhe","Zhen","Zheng","Zhi","Zhong","Zhou","Zhu","Zhua","Zhuai","Zhuan","Zhuang","Zhui","Zhun","Zhuo",      
            "Zi","Zong","Zou","Zu","Zuan","Zui","Zun","Zuo"
    };

        /// <summary> ת��һ�����ֵ���ƴ����ɵ��ַ���
        /// </summary>
        /// <param name="strChinese">��������ַ���</param>
        /// <returns>string</returns>
        /*  ���ã�
            IceCommonTools.ConvertTo.ChineseSpell("���ǵ�����");
         */
        public static string ToChineseSpell(string strChinese)
        {
            byte[] array = new byte[2];
            string strReturn = "";
            char[] nowchar = strChinese.ToCharArray();
            for (int j = 0; j < nowchar.Length; j++)
            {
                array = System.Text.Encoding.Default.GetBytes(nowchar[j].ToString());
                if ((int)(array[0]) <= 160 && (int)(array[0]) >= 0)
                {
                    strReturn += nowchar[j];
                }
                else
                {
                    for (int i = (pyvalue.Length - 1); i >= 0; i--)
                    {
                        if (pyvalue[i] <= (int)(array[0]) * 256 + (int)(array[1]) - 65536)
                        {
                            strReturn += pystr[i];
                            break;
                        }
                    }
                }
            }
            return strReturn;
        }
        #endregion

        /// <summary>
        /// SQLע�����
        /// </summary>
        /// <param name="strSQL">�����SQL���</param>
        /// <returns>��ȫSQL</returns>
        //tips������ʹ�ô洢���̲������ݣ����ô˷������˷Ƿ�����(Ҫʹ��sp_executesql��Ҫʹ�ã�exec)
        public static string PickSQL(string sSqlParameter)
        {
            sSqlParameter = (sSqlParameter == null || sSqlParameter.Length == 0) ? "" : sSqlParameter.Replace("'", "''");//�������滻������������

            sSqlParameter = new Regex("exec", RegexOptions.IgnoreCase).Replace(sSqlParameter, "exec");
            sSqlParameter = new Regex("xp_cmdshell", RegexOptions.IgnoreCase).Replace(sSqlParameter, "xp_cmdshell");
            sSqlParameter = new Regex("select", RegexOptions.IgnoreCase).Replace(sSqlParameter, "select");
            sSqlParameter = new Regex("insert", RegexOptions.IgnoreCase).Replace(sSqlParameter, "insert");
            sSqlParameter = new Regex("update", RegexOptions.IgnoreCase).Replace(sSqlParameter, "update");
            sSqlParameter = new Regex("delete", RegexOptions.IgnoreCase).Replace(sSqlParameter, "delete");
            sSqlParameter = new Regex("drop", RegexOptions.IgnoreCase).Replace(sSqlParameter, "drop");
            sSqlParameter = new Regex("create", RegexOptions.IgnoreCase).Replace(sSqlParameter, "create");
            sSqlParameter = new Regex("rename", RegexOptions.IgnoreCase).Replace(sSqlParameter, "rename");
            sSqlParameter = new Regex("truncate", RegexOptions.IgnoreCase).Replace(sSqlParameter, "truncate");
            sSqlParameter = new Regex("alter", RegexOptions.IgnoreCase).Replace(sSqlParameter, "alter");
            sSqlParameter = new Regex("exists", RegexOptions.IgnoreCase).Replace(sSqlParameter, "exists");
            sSqlParameter = new Regex("master.", RegexOptions.IgnoreCase).Replace(sSqlParameter, "master.");
            sSqlParameter = new Regex("restore", RegexOptions.IgnoreCase).Replace(sSqlParameter, "restore");
            if (sSqlParameter.IndexOf("or ") > -1)
            {
                sSqlParameter = sSqlParameter.Remove(sSqlParameter.IndexOf("or "));
            }
            if (sSqlParameter.IndexOf("and ") > -1)
            {
                sSqlParameter = sSqlParameter.Remove(sSqlParameter.IndexOf("and "));
            }

            return sSqlParameter;
        }

        /// <summary>
        /// ת����ȫSQL
        /// </summary>
        /// <param name="String"></param>
        /// <param name="IsDel"></param>
        /// <returns></returns>
        public static string GetSafeSqlString(string String, bool IsDel)
        {
            if (IsDel)
            {
                String = String.Replace("'", "");
                String = String.Replace("\"", "");
                return String;
            }
            String = String.Replace("'", "&#39;");
            String = String.Replace("\"", "&#34;");
            return String;
        }


    }
}
