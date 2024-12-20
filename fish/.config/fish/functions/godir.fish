function godir 
            
    if ! test -n "$argv[1]"
            echo "Defined directories:"
            echo "s: Sites"
            echo "c: Coding Related"
            echo "d: Downloads"
            echo "sm: StrudelMedia"
            echo "python: ~/src/python"
            echo "proj: $VIMWIKI/projects"
            echo "area: $VIMWIKI/area"
            echo "res: $VIMWIKI/res"
        return
    end

   switch $argv
        case 's'
            echo "Sites"
            cd ~/Sites
        case 'd'
            echo "Downloads"
            cd ~/Downloads
        case 'c'
            echo "Coding Related"
            cd ~/Documents/CODING\ RELATED
        case 'sm'
            echo "StrudelMedia"
            cd /Users/kmcbride/Documents/StrudelMediaLive
        case 'proj'
            echo "$VIMWIKI/projects"
            cd $VIMWIKI/projects && ls
        case 'area'
            echo "$VIMWIKI/area"
            cd $VIMWIKI/area && ls
        case 'res'
            echo "$VIMWIKI/res"
            cd $VIMWIKI/res && ls
        case 'python'
            echo "Python Source Dir"
            cd ~/src/python
        case '*'
           echo "S0rry, no match on shortcut: $argv" 
        end
end
