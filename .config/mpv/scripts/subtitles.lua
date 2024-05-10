mp.add_hook('on_load', 10, function ()
    mp.set_property('sub-file-paths', 'Subs/' .. mp.get_property('filename/no-ext'))
end)
