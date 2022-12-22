local impatient_status_ok, impatient = pcall(require, "impatient")
if not impatient then
    return
end

impatient.enable_profile()

