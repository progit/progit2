#!/usr/bin/env bash
to_utf8_recurse() {
    for file in "$1"/*;do
        #echo $file; exit;
        if [ -d "$file" ];then
            printf ">dir: $file \n=====\n"
            to_utf8_recurse "$file";

        elif [ -f "$file" ];then
            if [[ "$file" =~ ".asc" ]]; then
                ENCODING=$( file -b --mime-encoding $file )

                if ! ([[ $ENCODING == "utf-8" ]] || [[ $ENCODING == "us-ascii" ]]);then
                    RESULT=$(file --mime-encoding $file)
                    printf "        > File no utf-8 or us-ascii > $RESULT\n"
                    #printf "        > Before > $RESULT\n"

                    # iconv -f $ENCODING -t utf-8 "$file" > "$file.1"
                    # mv "$file.1" "$file"

                    # RESULT=$(file --mime-encoding $file)
                    # printf "        > After > $RESULT\n"                    


                fi
            fi
        fi
    done
}

to_utf8_recurse $1
exit;
