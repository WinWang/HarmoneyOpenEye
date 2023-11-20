#!/bin/bash
vp="vp"
fp="fp"
size_num=300
font_size_num=100
# Generate JSON for size_1 to size_300 and save to float.json
echo "{ \"float\": [" > float.json
for ((i=1; i<=$size_num; i++)); do
    echo "{
      \"name\": \"size_$i\",
      \"value\": \"$i$vp\"
    }" >> float.json
    if [ $i -lt $size_num ]; then
        echo "," >> float.json
    fi
done
if [ $font_size_num -gt 0 ]; then
    echo "," >> float.json
    for ((i=1; i<=$font_size_num; i++)); do
        echo "{
          \"name\": \"size_text_$i\",
          \"value\": \"$i$fp\"
        }" >> float.json
        if [ $i -lt $font_size_num ]; then
            echo "," >> float.json
        fi
    done
fi
echo "] }" >> float.json

echo "float.json file has been generated."
