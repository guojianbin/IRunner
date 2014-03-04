function getOffsetTop (el, p) {
    var _t = el.offsetTop;
    while (el = el.offsetParent) {
        if (el == p) break;
        _t += el.offsetTop;
    }

    return _t;
};
function getOffsetLeft (el, p) {
    var _l = el.offsetLeft;
    while (el = el.offsetParent) {
        if (el == p) break;
        _l += el.offsetLeft;
    }

    return _l;
};
var tt;
var curMenu;
function mouseover (th, menu) {

	var c1,c2,c3;
	c1=screen.width;
	c2=screen.height;
	c3=parseInt(c2);
	c1=parseInt(c1);
	switch(c1){
		case 0:
		c3=70;
		break;
		case "NaN":
		c3=70;
		break;
		case 1024:
		c3=70;
		break;
		case 1280:
		c3=190;
		break;
		case 1920:
		c3=50;
		break;
		case 800:
		c3=20;
		break;
		default: 
		c3=125;
	}

    if (tt) clearTimeout(tt);
    displayMenu(false);
    menu = document.getElementById('menu' + menu);
    menu.style.left = (getOffsetLeft(th)-c3) + 'px';
    menu.style.top = 155+ 'px';

    curMenu = menu;
    displayMenu(true);
}
function mouseout () {
    tt = setTimeout('displayMenu(false)', 200);
}
function _mouseover () {
    if (tt) clearTimeout(tt);
    displayMenu(true);
}
function _mouseout () {
    displayMenu(false);
}
function displayMenu (display) {
    if (curMenu) {
        curMenu.style.display = display ? 'block' : 'none';
    }
}


function changefile(i) 
{

var tempfile = document.getElementById("file"+i); 
var temptext = document.getElementById("text"+i); 
temptext.value=tempfile.value;

}
// JavaScript Document	 	2级菜单特效
function ShowHMenu(id){
var i=1;
var obj,obj1;
while(obj=document.getElementById("Hmenu_"+i)){
if(id==i){
obj.style.display='block';
obj1=document.getElementById("Hmenu_" + i + "_Title")
obj1.className='hover'
}
else{
obj.style.display='none';
obj1=document.getElementById("Hmenu_" + i + "_Title")
obj1.className=''
}
i++
}
}