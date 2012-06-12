packages = Array.new

case node[:lsb][:codename]
when "lucid"
  packages |= %w/
    gawk
  /
when "precise"
  include_recipe "libsigsegv"

  packages |= %w/
    gawk
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
