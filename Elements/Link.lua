Align = 'Left'
Width = "100%"
TextColour = colours.blue
UnderlineColour = nil
URL = nil

OnInitialise = function(self, node)
	local attr = self.Attributes
	if attr.href then
		self.URL = attr.href
	end
	
	if attr.ulcolour then
		self.UnderlineColour = self:ParseColour(attr.ulcolour)
	elseif attr.ulcolor then
		self.UnderlineColour = self:ParseColour(attr.ulcolor)
	end

	if attr.align then
		if attr.align:lower() == 'left' or attr.align:lower() == 'center' or attr.align:lower() == 'right' then
			self.Align = attr.align:lower():gsub("^%l", string.upper)
		end
	end
end

OnCreateObject = function(self, parentObject, y)
	return {
		Element = self,
		Y = y,
		X = 1,
		Width = self.Width,
		Align = self.Align,
		Type = "LinkView",
		Text = self.Text,
		TextColour = self.TextColour,
		UnderlineColour = self.UnderlineColour,
		BackgroundColour = self.BackgroundColour,
		URL = resolveFullUrl(self.URL)
	}
end