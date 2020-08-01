export
default{
    scrollTo(end,time){

        // 获取起点位置
        var start=document.body.scrollTop||document.documentElement.scrollTop;
        
        var x=start;
    
        var timer=setInterval(function(){
    
            x+=(end-start)/time*16.7;
    
            if(start<end){
                if(x>=end-200){
                    clearInterval(timer);
                    x=end-200;
                }
            }else{
                if(x<=end-200){
                    clearInterval(timer);
                    x=end-200;
                }
            }
    
            document.body.scrollTop=x;
            document.documentElement.scrollTop=x;
    
        },16.7)
    }
}