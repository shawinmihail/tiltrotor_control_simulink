function [ value_between ] = set_between(value, top_lim, bot_lim)

if value > top_lim
    value = top_lim;
elseif value < bot_lim
   value = bot_lim;
end

value_between = value;

end

