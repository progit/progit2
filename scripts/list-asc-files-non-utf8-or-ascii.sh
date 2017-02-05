#!/usr/bin/env bash
to_utf8_recurse() {
    for file in "$1"/*;do
        if [ -d "$file" ];then
            to_utf8_recurse "$file";

        elif [ -f "$file" ];then
            if [[ "$file" =~ ".asc" ]]; then
                ENCODING=$( file -b --mime-encoding $file )

                if ! ([[ $ENCODING == "utf-8" ]] || [[ $ENCODING == "us-ascii" ]]);then
                    RESULT=$(file --mime-encoding $file)
                    printf "  > $RESULT\n"
                fi
            fi
        fi
    done
}

printf "$1\n=====\n";
to_utf8_recurse $1
exit;
