function onTouch(hit)
 if hit.Name == "Radio" then
  if hit.Parent.Monitor.SurfaceGui.Main.Destination.Place1.Text == "Not in Service" then
     hit.Parent.Monitor.Value.Value = -2
  else
   hit.Parent.Monitor.Value.Value = script.Parent.DisplayValue.Value
  end
 end
end

script.Parent.Touched:connect(onTouch)