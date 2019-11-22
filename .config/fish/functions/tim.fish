function tim
    if test -e $argv
        open -a "Sublime Text.app" $argv
    else
        touch $argv
        open -a "Sublime Text.app" $argv
    end
end

