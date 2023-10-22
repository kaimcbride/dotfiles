function godir 
            
    if ! test -n "$argv[1]"
            echo "Defined directories:"
            echo "s: Sites"
            echo "c: Coding Related"
            echo "d: Downloads"
            echo "sm: Strudel Media"
            echo "python: ~/src/python"
            echo "proj: $NOTES/proj"
            echo "area: $NOTES/area"
            echo "inbox: $NOTES/inbox"
            echo "n: $NOTES/n"
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
            echo "Strudel Media"
            cd /Users/kmcbride/Documents/StrudelMediaLive
        case 'proj'
            echo "$NOTES/proj"
            cd $NOTES/proj && ls
        case 'area'
            echo "$NOTES/area"
            cd $NOTES/area && ls
        case 'inbox'
            echo "$NOTES/inbox"
            cd $NOTES/inbox && ls
        case 'n'
            echo "$NOTES"
            cd $NOTES && ls
        case 'python'
            echo "Python Source Dir"
            cd ~/src/python
        case '*'
           echo "S0rry, no match on shortcut: $argv" 
        end
end
