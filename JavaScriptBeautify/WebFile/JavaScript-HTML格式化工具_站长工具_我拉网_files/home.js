function checkEngines(b,bl)
     {
        var ipts = document.getElementsByTagName("input");
        var id = bl?'link':'site';
        for(var i=0;i<ipts.length;i++)
        {
            if(ipts[i].type == "checkbox"&&ipts[i].name.toLowerCase().indexOf(id)!=-1)
            {
                ipts[i].checked = b;
            }
        }
     }
     function pst(k,url)
     {
        var v = getid('addr_more');
        if(v.value&&v.value.length>0&&v.value.toLowerCase() != 'http://www.')
        {
            $post(url,{"k":k,"v":v.value});
        }
        else
        {
            alert("请输入正确的信息后，再提交查询！");
        }
     }
     function pstall()
     {
        var v = getid('addr_more').value;
        if(v&&v.length>0&&v.toLowerCase() != 'http://www.'&&arguments.length>0)
        {
            for(var i=0;i<arguments.length;i++)
            {
                $postb(arguments[i][1],{"k":arguments[i][0],"v":v});
            }
        }
        else
        {
            alert("请输入正确的信息后，再提交查询！");
        }
     }
    function addEvent(eventHandler)
    {
        var tags = document.getElementsByTagName('input');
        for(var i=0;i<tags.length;i++)
        {
            if(tags[i].getAttribute('url') == 'true')
            {
                if(tags[i].addEventListener)
                {
                    tags[i].addEventListener('keyup',eventHandler,true);
                }
                else
                {
                    tags[i].attachEvent('onkeyup',eventHandler);
                }
            }
        }
    }
    function addInput(e)
    {
        var obj = e.target ? e.target : e.srcElement;
        var tags = document.getElementsByTagName('input');
        for(var i=0;i<tags.length;i++)
        {
            if(tags[i].getAttribute('url') == 'true'&&tags[i]!=obj)
            {
                tags[i].value = obj.value;
            }
        }
    }
    window.onload = function()
    {
        addEvent(addInput);
    }
    function tianjia(obj)
    {
      var Result=document.getElementById(obj).innerHTML.replace(/<.*?>/g,"");;
      window.clipboardData.setData("Text",Result); 
      window.alert('域名Whois查询结果已复制到剪切板上！');
    }
    
    function SearchTotal()
    {
        var v = document.getElementById('addr_more').value;
        if(v && v.length>0 && v.toLowerCase() != 'http://www.')
        {
          var ipUrl="http://www.55la.cn/ip/?Ip="+v.replace("http://","");
          var prUrl="http://www.55la.cn/Ranks/?domainName="+v;
          var whoisUrl="http://www.55la.cn/whois/?domainName="+v.replace("http://","").replace("www.","");
          var alexaUrl="http://a.55.la/index.php?domainName="+v.replace("http://","").replace("www.","");
          var linkUrl="http://www.55la.cn/link/?domainName="+v;
          window.open(ipUrl,'_blank');
          window.open(whoisUrl,'_blank');
          window.open(alexaUrl,'_blank');
          window.open(prUrl,'_blank');
          window.open(linkUrl,'_blank');


        }
        else
        {
            alert("请输入正确的信息后，再提交查询！");
        }
    }

	function gotoUrl(url,gettype)
    {
        var v = document.getElementById('addr_more').value;
        if(v&&v.length>0&&v.toLowerCase() != 'http://www.')
        {
          var ipUrl=url+"?"+gettype+"="+v.replace("http://","");
          window.open(ipUrl);
        }
        else
        {
            alert("请输入正确的信息后，再提交查询！");
        }
    }