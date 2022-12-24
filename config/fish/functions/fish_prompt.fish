function fish_prompt

    set --query lambda_color_pwd || set --global lambda_color_pwd "yellow"
    set --query lambda_color_duration || set --global lambda_color_duration "cyan"
    set --query lambda_color_prompt || set --global lambda_color_prompt "white"
    set --query lambda_prompt_character || set --global lambda_prompt_character 'λ'

    set prompt_pwd (string replace --ignore-case -- ~ \~ $PWD)
    #this part was stolen from hydro prompt
    function prompt_postexec --on-event fish_postexec
        test "$CMD_DURATION" -lt 1000 && set _prompt_cmd_duration && return
    
        set --local secs (math --scale=1 $CMD_DURATION/1000 % 60)
        set --local mins (math --scale=0 $CMD_DURATION/60000 % 60)
        set --local hours (math --scale=0 $CMD_DURATION/3600000)
    
        test $hours -gt 0 && set --local --append out $hours"h"
        test $mins -gt 0 && set --local --append out $mins"m"
        test $secs -gt 0 && set --local --append out $secs"s"
    
        set --global _prompt_cmd_duration "$out"
    end


    echo -ne (set_color $lambda_color_pwd)$prompt_pwd" "
    echo -ne (set_color $lambda_color_duration)$_prompt_cmd_duration ""
    echo -ne (set_color $lambda_color_prompt)$lambda_prompt_character(set_color $fish_color_normal)" "

    
end
