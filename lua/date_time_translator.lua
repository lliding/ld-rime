local function date_time_translator(input, seg)
  if (input == "/dd") then
    --- Candidate(type, start, end, text, comment)
    yield(Candidate("date", seg.start, seg._end, os.date("%m月%d日"), ""))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
    yield(Candidate("date", seg.start, seg._end, os.date("%m-%d"), ""))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), ""))
  end
  if (input == "/tt") then
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), ""))
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), ""))
  end
  if (input == "/ww") then
    local weakTabZh = {'日', '一', '二', '三', '四', '五', '六'}
    local weakTabEnSimp = {'Sun', 'Mon', 'Thues', 'Wed', 'Thur', 'Fri', 'Sat'}
    local weakTabEnFull = {'Sunday', 'Monday', 'Thuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'}
    yield(Candidate("week", seg.start, seg._end, "周"..weakTabZh[tonumber(os.date("%w")+1)], ""))
    yield(Candidate("week", seg.start, seg._end, "星期"..weakTabZh[tonumber(os.date("%w")+1)], ""))
    yield(Candidate("week", seg.start, seg._end, weakTabEnSimp[tonumber(os.date("%w")+1)], ""))
    yield(Candidate("week", seg.start, seg._end, weakTabEnFull[tonumber(os.date("%w")+1)], ""))
  end
  if (input == "/mm") then
    yield(Candidate("month", seg.start, seg._end, os.date("%B"), ""))
    yield(Candidate("month", seg.start, seg._end, os.date("%b"), "缩写"))
  end
end

return date_time_translator
