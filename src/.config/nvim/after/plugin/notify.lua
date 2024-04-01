local notify_status_ok, notify = pcall(require, 'notify')
if not notify_status_ok then
    return
end

notify.setup {
    stages = "fade_in_slide_out",
    on_open = nil,
    on_close = nil,
    render = "default",
    timeout = 175,
    background_colour = "#202020",
    minimum_width = 10,
    icons = {
        ERROR = '',
        WARN = '',
        INFO = '',
        DEBUG = '',
        TRACE = '',
    },
}

do
    vim.cmd [[
        highlight NotifyERRORBorder guifg=#E06C75
        highlight NotifyWARNBorder guifg=#E5C07B
        highlight NotifyINFOBorder guifg=#61AFEF
        highlight NotifyDEBUGBorder guifg=#ABB2BF
        highlight NotifyTRACEBorder guifg=#C678DD
        highlight NotifyERRORIcon guifg=#E06C75
        highlight NotifyWARNIcon guifg=#E5C07B
        highlight NotifyINFOIcon guifg=#61AFEF
        highlight NotifyDEBUGIcon guifg=#ABB2BF
        highlight NotifyTRACEIcon guifg=#C678DD
        highlight NotifyERRORTitle  guifg=#E06C75
        highlight NotifyWARNTitle guifg=#E5C07B
        highlight NotifyINFOTitle guifg=#61AFEF
        highlight NotifyDEBUGTitle  guifg=#ABB2BF
        highlight NotifyTRACETitle  guifg=#C678DD
        highlight link NotifyERRORBody Normal
        highlight link NotifyWARNBody Normal
        highlight link NotifyINFOBody Normal
        highlight link NotifyDEBUGBody Normal
        highlight link NotifyTRACEBody Normal
    ]]
end
