/**
 * Created by Daniel on 15-12-28.
 */
function timer(id,interval)
{
    this.id=id;
    this.control=document.getElementById(id);
    this.interval=interval|1000;

    this.timer=null;
    var _this=this;

    this.start=function(fun)
    {
        if(this.control)
        {
            this.startHandler();
            this.timer=window.setInterval(this.startHandler,this.interval);
        }
    }

    this.close=function()
    {
        if(this.timer!=null)
            window.clearInterval(this.timer);
    }

    this.startHandler=function()
    {
        var date = new Date();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        _this.control.innerHTML = date.getFullYear() + "年" +_this.padding(month) + "月" + _this.padding(strDate) + "日 " + _this.padding(date.getHours()) + ":" + _this.padding(date.getMinutes()) + ":" + _this.padding(date.getSeconds());
    }

    this.padding=function(value)
    {
        if(value<10)
            return "0"+value;
        return value;
    }
}