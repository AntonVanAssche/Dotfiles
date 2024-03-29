local mini_status_ok, mini = pcall(require, "mini.align")
if not mini_status_ok then
    return
end

mini.setup()
