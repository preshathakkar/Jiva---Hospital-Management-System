

	function validname(name)
	{	if(name.length > 1)
		{	
			for(var i=0;i<name.length;i++)
			{	code=name.charCodeAt(i);
				if(!((code >= 65 && code <= 90) || (code >= 97 && code <= 122)))
						return false;
			}
			return true;
		}
		else
			return false;
	}
	
	
	function validPrice(number)
	{	if(number.length > 1)
		{	
			for(var i=0;i<number.length;i++)
			{	code=number.charCodeAt(i);
				if(code > 48 || code < 57 || code==46)
						return true;
			}
			return false;
		}
		else
			return false;
	}
	
	
function patid(name){
if(name.length==8)
{
			if(name.subString(0,1).toString()=="p")
			{
						for(var i=0;i<name.length
							;i++)
							{												
							code=name.charCodeAt(i);
							if(code < 48 || code > 57)
								{
									return false;
								}
							}	
						return true;
			}

			else
			{
				return false;
			}


}

else
{
	return false;
}

}
	

function notNull(name)
	{	if(name.length >= 0)
		{				
			return true;
		}
		else
			return false;
	}
	
function validEmail(name)
{

at=name.value.indexOf("@");
if (at == -1)
	{
	
	return false;
	}
return true;
}
	
	
function TestValid()
{
	var EXColor="#FFFFCC";
	var OKColor="#FFFFFF";
	var f=0;
		if(validPrice(frmtest.tstch.value))
		{
			
			document.getElementById("tstch").borderColor=OKColor;
			}
		else
		{
			document.getElementById("tstch").borderColor=EXColor;
			window.alert("ch");
			
			f++;

		}
		
		if(validname(frmtest.tstname.value))
		{
			
			document.getElementById("tstname").borderColor=OKColor;
		}
		else
		{
			document.getElementById("tstname").borderColor=EXColor;
			window.alert("name");
			f++;			
		}
		if(f>0)
		{
			return false;
		}
		else
		{
				dispage:('../test/testadd.jsp','middleFullWidth');
				return true;	
		}


}
