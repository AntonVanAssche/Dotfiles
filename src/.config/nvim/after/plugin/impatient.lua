local impatient_status_ok, impatient = pcall(require, "impatient")
if not impatient_status_ok then
    return
end

impatient.enable_profile()
