    function GetMainFocus()
   {
     document.getElementById('addr_more').focus();
     document.getElementById('addr_more').select();
   }
 //网页关键字密度获取文本焦点
 function GetDensityfocus()
 {
  document.getElementById('ctl00_Main_DKeyWords').focus();
  document.getElementById('ctl00_Main_DKeyWords').select();
 }
  //网页Meta信息获取文本焦点
  function GetMetafocus()
 {
  document.getElementById('ctl00_Main_txtSiteUrl').focus();
  document .getElementById('ctl00_Main_txtSiteUrl').select();
 }

 //搜索蜘蛛、机器人模拟获取文本焦点
 function GetRobotfocus()
 {
  document.getElementById('ctl00_Main_txtSiteUrl').focus();
  document.getElementById('ctl00_Main_txtSiteUrl').select();
 }
 
 //URL16进制加密
 function Getfocus()
 {
  document.getElementById('ctl00_Main_Address').focus();
  document.getElementById('ctl00_Main_Address').select();
 }
 
 //MD5加密
  function Getfocus()
 {
  document.getElementById('ctl00_Main_Address').focus();
  document.getElementById('ctl00_Main_Address').select();
 }
 //网站收录情况
 function GetSitefocus()
 {
  document.getElementById('ctl00_Main_Site_Domain').focus();
  document.getElementById('ctl00_Main_Site_Domain').select();
 }
 //网站反链接情况
  function GetfanLinkfocus()
 {
  document.getElementById('ctl00_Main_Link_Domain').focus();
  document.getElementById('ctl00_Main_Link_Domain').select();
 }
 //PR查询
  function GetPRfocus()
 {
  document.getElementById('ctl00_Main_PRAddress').focus();
  document.getElementById('ctl00_Main_PRAddress').select();
 }
 
 //站内链接分析
function GetLinkfocus() {
        document.getElementById('ctl00_Main_DAddress').focus();
        document.getElementById('ctl00_Main_DAddress').select();
     }
//友情链接IP查询
function GetLinkipfocus()
{
        document.getElementById('ctl00_Main_LAddress').focus();
        document.getElementById('ctl00_Main_LAddress').select();
}
//关键字排名查询
 function GetKeyWordfocus()
 {
   document.getElementById('ctl00_Main_KeyWords').focus();
    document.getElementById('ctl00_Main_KeyWords').select();
 }
 //Ip查询
 function GetIpfocus()
 {
    document.getElementById('Ip').focus();
    document.getElementById('Ip').select();
}
//网页Gzip压缩检测
 function GetGzipfocus()
 {
   document.getElementById('ctl00_Main_txtSiteUrl').focus();
    document.getElementById('ctl00_Main_txtSiteUrl').select();
 }
 //百度近日收录情况查询
 function GetBaiduFoucs()
{
    document.getElementById('ctl00_Main_Address').focus();
    document.getElementById('ctl00_Main_Address').select();
}

//IP WHOIS查询
function GetipWhois()
{
   document.getElementById('ctl00_Main_ipAddress').focus();
   document.getElementById('ctl00_Main_ipAddress').select();
}

//域名删除时间
function GetDomainDeleteTime()
{
   document.getElementById('ctl00_Main_txtDomain').focus();
   document.getElementById('ctl00_Main_txtDomain').select();
}

function GetRobot()
{
    var url = document.getElementById("webUrl").value.toLowerCase( ).replace(/\s+/g,"");
    if(url=="")
    {
        window.location.href="http://localhost:18369/Tools/Robot.aspx";
    }
    else 
    {
        window.location.href='http://localhost:18369/Tools/Robot.aspx?webUrl='+encodeURIComponent(url);
    }
}