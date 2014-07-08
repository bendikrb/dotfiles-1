function festive_prompt
  # figure out what icon to use
  switch (date "+%m")
  case '1'
    printf '🎉  '
  case '7'
    printf '🇺🇸  '
  case '10'
    printf '🎃  '
  case '11'
    printf '🍗  ' 
  case '12'
    printf '🎅  '
  case '*'
    printf 'ॐ '
  end
end
