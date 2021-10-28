const noSpaceForm=(obj)=>{
	const str_space = /\s/;
    if(str_space.exec(obj.value)) 
    {
        obj.focus();
        obj.value = obj.value.replace(" ","");
        
        return false;
    }
}

const noKoreanForm=(obj)=>{
	const str_korean = /[ㄱ-ㅎㅏ-ㅣ가-힣\s]/g;
    if(str_korean.exec(obj.value))
    {
        obj.focus();
        obj.value = obj.value.replace(str_korean,"");
        
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