local toggle_term_status_ok, toggle_term = pcall(require, "toggleterm")
if not toggle_term_status_ok then
    return
end

toggle_term.setup()

