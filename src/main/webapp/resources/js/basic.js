const noSpaceForm=(obj)=>{
	const str_space = /\s/;
    if(str_space.exec(obj.value)) 
    {
        obj.focus();
        obj.value = obj.value.replace(" ","");
        
        return false;
    }
}

const numberForm=(obj)=>{
	const str_number = /[^0-9]/g;
    if(str_number.exec(obj.value))
    {
        obj.focus();
        obj.value = obj.value.replace(str_number,"");
        
        return false;
    }
}
			
const emailCheck=function(email) {
	var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	return reg.test(email);
}

const phoneNumberCheck=function(phoneNumber){
	return phoneNumber.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-");
}