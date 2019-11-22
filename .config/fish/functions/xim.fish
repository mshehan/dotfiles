function xim
	if test -e $argv
		open -a "XCode.app" $argv
	else 
		touch $argv
		open -a "XCode.app" $argv
	end
end 