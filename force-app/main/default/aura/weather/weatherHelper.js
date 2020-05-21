({
    CurrentWeather : function(component, event) {
        var action =component.get('c.findWeather');
        action.setParams({
            cityName: component.get('v.cityname')
        });
        action.setCallback(this, function(response){
            var  state= response.getState();
            if(state !='SUCCESS'){
                alert('Please enter valid city name');
            }
            var res =response.getReturnValue();
            var iconUrl='http://openweathermap.org/img/wn/'+res.weather[0].icon+'@2x.png';
            component.set('v.iconId',iconUrl);
            component.set('v.weatherData',res);
            component.set('v.flag','true');
        },'ALL');
        $A.enqueueAction(action);
        
    },
    
    ForCastWeather : function(component, event) {
        var action =component.get('c.ForeCastWeather');
        action.setParams({
            cityName: component.get('v.cityname')
        });
        action.setCallback(this, function(response){
            var  state= response.getState();
            var res =response.getReturnValue();
            var wlist=res.list;
            
            // console.log('ForCaseList',wlist);
            component.set('v.ForCaseList',wlist);
            
        },'ALL');
        $A.enqueueAction(action);
        
    },
})