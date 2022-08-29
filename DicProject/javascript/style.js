
//文字
var text=[];
//矩形
var  rectangle=[];

function getsunstylerect()
{
 return "#ffffff";
}
function getsunstyletext()
{
 return "#696969";
}

function getmoonstylerect()
{
 return "#383838";
}
function getmoonstyletext()
{
 return "#EDEDED";
}


function  init()
{

    console.log("hi")

}

function addTextObject(obj)
{


}
function addRectangleObject(obj)
{

    console.log(rectangle.length)
    rectangle[rectangle.length]=obj

}
function stylesun()
{
    for(var j=0;j<rectangle.length;++j)
    {
        rectangle[j].color=getsunstylerect()
    }

}
function stylemooon()
{

    for(var j=0;j<rectangle.length;++j)
    {
        rectangle[j].color=getmoonstylerect()
    }
}


