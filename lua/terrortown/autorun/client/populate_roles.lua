
local id = "ttt_roleshelp"
local materialIcon = Material("vgui/ttt/vskin/helpscreen/guide")




local htmlStart = [[
	<head>
		<style>
			body {
				font-family: Trebuchet, Verdana;
				background-color: rgb(22, 42, 57);
				color: white;
				font-weight: 100;
			}
			body * {
				font-size: 13pt;
			}
			h1 {
				font-size: 16pt;
				text-decoration: underline;
			}
		</style>
	</head>
	<body>
]]

local htmlEnd = [[
	</body>
]]


hook.Add("TTT2ModifyHelpMainMenu", "RegisterRolesHelp", function(helpData)
	local menuData = helpData:RegisterSubMenu(id)
	menuData:SetTitle(language.GetPhrase("roledesc.menuname"))
	menuData:SetIcon(materialIcon)
	menuData:SetDescription(language.GetPhrase("roledesc.menudesc"))

end)



HELPSCRN.subPopulate[id] = function(helpData, pid)
	-- roles
	local rolelist = GetSortedRoles()
	for i = 1, #rolelist do
		local role = rolelist[i]["name"]

		local rolename = language.GetPhrase("roledesc.rolename." .. role)
		local roledesc = language.GetPhrase("roledesc.description." .. role)

		local roleData = helpData:PopulateSubMenu(id .. "_role_" .. tostring(role))

		roleData:SetTitle(rolename)
		roleData:PopulatePanel(function(parent)
			local header =  "<h1> " .. rolename .. ": "

			header = header .. "</h1>"

			local html = vgui.Create("DHTML", parent)
			html:SetSize(500, 800)
			html:Dock(FILL)
			html:SetHTML(htmlStart .. header .. roledesc .. htmlEnd)
		end)
	end
end


function firstToUpper(str)
	return str:gsub("^%l", string.upper)
end
