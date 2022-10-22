local hlslens_ok, hlslens = pcall(require, "hlslens")

if not hlslens_ok then
  return
end

hlslens.setup()
