require("smart-enter"):setup({
	open_multi = true,
})

Status:children_add(function()
	local h = cx.active.current.hovered
	if not h or ya.target_family() ~= "unix" then
		return ""
	end

	local time = math.floor(h.cha.mtime or 0)
	local mtime_str = time > 0 and os.date("%a %b %d %Y %H:%M:%S", time) or ""

	return ui.Line({
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		ui.Span(":"):fg("magenta"),
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		ui.Span(" " .. mtime_str .. " "):fg("cyan"),
	})
end, 500, Status.RIGHT)
