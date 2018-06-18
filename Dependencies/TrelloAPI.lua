--[[
	IF YOU DONT KNOW HOW TO SCRIPT GET OUT YOU WONT KNOW HOW TO USE THIS! -Dont mean to be rude, but it's true
	
	I suggest you move the script and take it out of the model then put the TrelloAPI into the ServerScriptService as exploiters will not be able to acess it in most cases, but thats just me. - nstrike159

	There is a test script in here for those of you who want to test your configuration to use it MAKE SURE TO DISABLE IT!
	
	When something returns a table try running a recruisive function or loop to see what is inside the table
	EX:
	function printTable(tab)
		local recrlimit=20--Sets recrusive limit so you do not crash studio if u want this off set it to some rediculous value like 10000
		local inarray=false
		local rep=0
		local function printArrInfo(arr)
			if #arr>recrlimit and inarray then
				return
			end
			for i,v in next,arr do
				if	type(v)=="table" then
					print(string.rep("\t",rep)..tostring(i).."={")
					inarray=true
					rep=rep+1
					printArrInfo(v)
				else
					print(string.rep("\t",rep)..tostring(i).."=".."\""..tostring(v).."\"")
				end
			end
			if inarray then
				rep=rep-1
				print(string.rep("\t",rep).."}")
				inarray=false
			end
		end
		printArrInfo(tab)
	end
	
	--HINT: Use the above function if you want to find out whats inside a table returned!
	
-Instructions
	 1. Go to this link and click allow: 
	https://trello.com/1/authorize?key=aded73d328dce4a0698a6744856b3326&name=Roblox+Api&expiration=never&response_type=token&scope=read,write	
	 2. Copy the random numbers and letters in the page sent to you
	 3. Paste the random numbers and letters in the Value of Token (or make a variable named "token" in your script and put the value there)
	 4. If anywhere an error occurs when in use with "Unauthorized" you didnt copy the full link!(or you added a space in the beggining)
	
-Functions
	--------------
	 GetBoardID([Board Name]) return Board ID
	--------------
	 GetListID([List Name],[Board ID]) return List ID
	--------------
	 GetCardID([Name],[Board ID]) returns Card ID
	--------------
	 GetBoardInfo([Board ID]) returns a table like this except not JSON 
	{
    "id": "4eea4ffc91e31d1746000046",
    "name": "Example Board",
    "desc": "This board is used in the API examples",
    "lists": [{
        "id": "4eea4ffc91e31d174600004a",
        "name": "To Do Soon"
    }, {
        "id": "4eea4ffc91e31d174600004b",
        "name": "Doing"
    }, {
        "id": "4eea4ffc91e31d174600004c",
        "name": "Done"
    }]
	}
	--------------
	 GetCardInfo([Card ID],[Board ID]) returns an table 
	 EX: {name="cardName",desc="cardDescription",...}
	-----------
	 GetLists([Board ID]) returns a table
	------------
	 AddCard([Name],[Decription],[List ID],Optional[AddUrl],Optional[Position **Valid Values: A position. top, bottom, or a positive number.**],Optional[Due*Default=null*],Optional[Label**Valid Values: all or a comma-separated list of: blue,green,orange,purple,red,yellow**],Optional[CardToCopyID]) returns a Table
	------------
	 AddList([Name],[Board ID],Optional[List to Copy],Optional[Position *Valid Values: position. top, bottom, or a positive number.*])
	------------
	 *DEPRICATED*AddBoard([Name],[Description]) Use CreateBoard Instead
	------------
	 AddCardAtt([Card ID],[Name],[File,URL],[Value])		
	------------
	 AddLabel([Name],[Color],[Board ID]) returns Label ID
	------------
	 AddCardLabel([Card ID],[Label ID])	
	------------
	 GetLabels([Board ID])	returns a table such as bellow 
	 EX: [{"id":"559adc5e19ad3a5dc2b9c003", "idBoard":"559adc5e9ad91e64b569a4d9", "name":"", "color":"green", "uses":0},
		 {"id":"559adc5e19ad3a5dc2b9c004", "idBoard":"559adc5e9ad91e64b569a4d9", "name":"", "color":"yellow", "uses":0},
		 {"id":"559adc5e19ad3a5dc2b9c006", "idBoard":"559adc5e9ad91e64b569a4d9", "name":"", "color":"red", "uses":0},
		 {"id":"559adc5e19ad3a5dc2b9c007", "idBoard":"559adc5e9ad91e64b569a4d9", "name":"", "color": "purple", "uses":0},
		 {"id":"559adc5e19ad3a5dc2b9c008", "idBoard":"559adc5e9ad91e64b569a4d9", "name":"", "color": "blue", "uses":0}]
	------------
	 GetCardsInList([List ID])	returns a table containing the cards in the list 
	 EX: [{name="cardName",desc="cardDescription",...},{name="cardName",desc="cardDescription",...}]
	------------
	 PostComment([Card ID],Text)
	------------	
	 AddCheckList()		
	------------	
	 GetLabelID(LabelName, BoardID)		
	------------
	 GetMemberBoards(Username) returns a table containing the boards a member is in
	------------
	 GetBoardMembers(BoardID)	returns the members of a board in a array like this
	EX: [{"id":"4ee7df1be582acdec80000ae", "fullName":"Bob Tester", "username":"bobtester"}, 
		{"id":"4ee7df74e582acdec80000b6", "fullName":"David Tester", "username":"davidtester"},
		{"id": "4ee7deffe582acdec80000ac", "fullName": "Joe Tester", "username": "joetester"}]
	------------
	 CreateBoard(Name,[Optional]desc,[Optional]{"private","public"}) returns the information about a board and creates a board 	
	------------
	 GetAllBoards() returns a array of BoardIDs of ALL boards you are in without board names!
	------------
	 GetBoardNameFromId([Board ID]) gets the board name from the id 	
	------------
	 AddCustomCard(Array/Dictionary,[List ID])	Here is a example Array using all valid values you could have in the array
		{
			name="CardName",
			desc="CardDescription",																	--REMEMBER THIS IS IN MARKDOWN SO IT IS RECOMENDED TO USE [[ INSTEAD OF "
			pos="bottom", 																			--Valid Values: A position. top, bottom, or a positive number in a string.
			due="2016-12-25",																		--Valid Values: A date, or nil
			labels="all", 																			--Valid Values: all or a comma-separated list of: blue, green, orange, purple, red, yellow REMEMBER THIS IS NOT NEEDED YOU CAN LEAVE THIS OUT!
			idMembers="54d77d9a7559e423tf23g2e7",													--Valid Values: A comma-separated list of member IDs,
			idLabels="1a2b3c4d5e6f7g8h9i10j11k12l",													--Valid Values: A comma-separated list of labelIds
			urlSource="http://assetgame.roblox.com/Thumbs/Avatar.ashx?username=Shedletsky",			--Valid Values: a url starting with http:// or https:// or nil
			fileSource="some.website.com/something.php", 											--Valid Values: a file
			idCardSource="4eea4ffc91e31d174600004a",												--Valid Values: The id of the card to copy into a new card.
			keepFromSource="all"																	--Valid Values: all or a comma-seperated list of: name, desc, pos, due, labels, idMembers, idLabels, urlSource, fileSource		
		}	
-Events
	------------
	.CardAdded(ListID,[Optional]Refresh_Time_In_Seconds,[Optional]Iterate_Through_All_Cards_First)
		:connect(FUNCTION) --Function has argument of a table of the cards information like function cardAdded(Card)
		:disconnect()
	.CarRemoved(ListID,[Optional]Refresh_Time_In_Seconds,[Optional]Iterate_Through_All_Cards_First)
		:connect(FUNCTION)
		:disconnect()		
	EXAMPLE:
		'''
			function cardAdded(card)
				print(card.name)
			end
			function cardRemoved(card)
				print(card.name)
			end
			local api=require(script.Parent.TrelloAPI) 
			local boardid=api:GetBoardID("TestBoard")--The board id is different from the link you see when you go to a board 
			local listid=api:GetListID("Testing",boardid) 
			api.CardAdded(listid):connect(cardAdded)																																																																																																																																																																																																																																																																																																																																																																																																																																																																																	   	OUCH MY BACK!
			api.CardRemoved(listid):connect(cardRemoved)
		'''			
--]]--]]-- ]]--]]
local suc,err=pcall(function()
	if game.Players.LocalPlayer~=nil then
		warn("It is unsafe to have the api in a local enviorment pleasae move it to ServerScriptService and ONLY use it from Server Scripts!")
	end
end)
if not suc then
	warn("It is unsafe to have the api in a local enviorment pleasae move it to ServerScriptService and ONLY use it from Server Scripts!")
end
local Private=true
local addon
local HS={}
function HS:PostAsync(url,jsonData)
	local rhs=game:GetService("HttpService");
	local data
	local thread=coroutine.create(function(u,j)
		
		local suc,msg=false,"";
		repeat 
			suc,msg=pcall(function()
				data=rhs:PostAsync(u,j)
			end)
			--print(data)
			wait()
		until suc
		coroutine.yield(data)
	end)
	local status,d=coroutine.resume(thread,url,jsonData);
	while data==nil do
		wait()
	end
	print("PostSync Completed")
	return data
end
function HS:GetAsync(url,cache)
	local rhs=game:GetService("HttpService");
	local data
	local thread=coroutine.create(function(u,j)
		
		local suc,msg=false,"";
		repeat 
			suc,msg=pcall(function()
				data=rhs:GetAsync(u,j)
			end)
			--print(data)
			wait()
		until suc
		coroutine.yield(data)
	end)
	local status,d=coroutine.resume(thread,url,cache);
	while data==nil do
		wait()
	end
	print("GetSync Completed")
	return data
end
function HS:JSONEncode(tab)
	local rhs=game:GetService("HttpService");
	return rhs:JSONEncode(tab)
end
function HS:JSONDecode(tab)
	local rhs=game:GetService("HttpService");
	return rhs:JSONDecode(tab)
end
local IS=game:GetService("InsertService")
local T = {}
if script:FindFirstChild("Token")==nil and getfenv(0).token==nil then error("No token available please set one using this link and putting the random numbers and letters into "+script:GetFullName()+" or put it in a global variable in the script calling the TrelloAPI named 'token' (ignore the warning you get when creating a script if you do this) \nhttps://trello.com/1/authorize?key=aded73d328dce4a0698a6744856b3326&name=Roblox+Api&expiration=never&response_type=token&scope=read,write") end
while script:FindFirstChild("Token")==nil and getfenv(0).token==nil do wait() end
local token=script.Token.Value..""
script.Token:Destroy()
function getAddon()
	if token~="" then
		addon="?key=aded73d328dce4a0698a6744856b3326&token="..token
	elseif getfenv(0).token~=nil then
		local val=getfenv(0).token
		addon="?key=aded73d328dce4a0698a6744856b3326&token="..val
	else
		error([[-Instructions.
	 \n 1. Go to this link and click allow: https://trello.com/1/authorize?key=aded73d328dce4a0698a6744856b3326&name=Roblox+Api&expiration=never&response_type=token&scope=read,write	
	 \n 2. Copy the token in the page sent to you
	 \n 3. Paste the token in the Value of Token]])
	end
	return "&key=aded73d328dce4a0698a6744856b3326&token="..token
end
--[[
	POST /1/cards/[card id or shortlink]/actions/comments
	Required permissions: comments
	Arguments
	text (required)
		Valid Values: a string with a length from 1 to 16384
--]]--]]
function T:PostComment(cid,t)
				local url
			if Private then
				getAddon()
				url="https://api.trello.com/1/cards/"..tostring(cid).."/actions/comments"..addon
			else
				 url="https://api.trello.com/1/cards/"..tostring(cid).."/actions/comments"..addon
			end
			local dat={
				text=t
			}
			local data=HS:JSONEncode(dat)
			local re=HS:PostAsync(url,data)
			local red=HS:JSONDecode(re)
			return red
end
--/1/lists/[idList]/cards
--[[
	[{
    "id": "4eea503791e31d1746000080",
    "checkItemStates": [],
    "closed": false,
    "dateLastActivity": "2011-12-15T19:53:27.228Z",
    "desc": "",
    "descData": null,
    "email": null,
    "idAttachmentCover": null,
    "idBoard": "",
    "idLabels": [],
    "idList": "",
    "idMembersVoted": [],
    "idShort": 3,
    "manualCoverAttachment": false,
    "name": "Finish my awesome application",
    "pos": 65536,
    "shortLink": "XlG8S7ll",
    "badges": {
        "votes": 0,
        "viewingMemberVoted": false,
        "subscribed": false,
        "fogbugz": "",
        "checkItems": 0,
        "checkItemsChecked": 0,
        "comments": 0,
        "attachments": 0,
        "description": false,
        "due": null
    },
    "due": null,
    "idChecklists": [],
    "idMembers": [],
    "labels": [],
    "shortUrl": "",
    "subscribed": false,
    "url": ""
}
]]--]]--]]--]]
	 function T:GetCardsInList(lid)
			local url
			if Private then
				getAddon()
				url="https://api.trello.com/1/lists/"..tostring(lid).."/cards"..addon
			else
				 getAddon()
				 url="https://api.trello.com/1/lists/"..tostring(lid).."/cards"..addon
			end
			local re=HS:GetAsync(url,true)
			local dat=HS:JSONDecode(re)
		return dat
	end
--[[
	POST /1/labels
	Required permissions: write
	Arguments
	name (required)
		Valid Values: a string with a length from 0 to 16384
	color (required)
		Valid Values: A valid label color or null
	idBoard (required)
		Valid Values: An id
--]]--]]
function T:AddLabel(nae,col,boardid)
	local url
		if Private then
			getAddon()
			url="https://api.trello.com/1/labels"..addon
		else
			 url="https://api.trello.com/1/labels"..addon
		end
	local dat={
		name=nae,
		color=col,
		idBoard=boardid
	}
	local data=HS:JSONEncode(dat)
	local re=HS:PostAsync(url,data)
	--print(re)
	return (HS:JSONDecode(re)).id
end
--[[
	GET /1/boards/[board_id]

Required permissions: read
Arguments Show
Examples
https://api.trello.com/1/boards/4eea4ffc91e31d1746000046?lists=open&list_fields=name&fields=name,desc&key=[application_key]&token=[optional_auth_token]
{
    "id": "4eea4ffc91e31d1746000046",
    "name": "Example Board",
    "desc": "This board is used in the API examples",
    "lists": [{
        "id": "4eea4ffc91e31d174600004a",
        "name": "To Do Soon"
    }, {
        "id": "4eea4ffc91e31d174600004b",
        "name": "Doing"
    }, {
        "id": "4eea4ffc91e31d174600004c",
        "name": "Done"
    }]
}
--]]--]]
function T:GetBoardNameFromId(id)
	getAddon()
	local ret=HS:GetAsync("https://api.trello.com/1/boards/"..id..addon,true)
	local data=HS:JSONDecode(ret)
	return data["name"]
end
--[[
GET /1/tokens/[token]/member

Required permissions: read
Arguments Show]]--]]--
function T:GetAllBoards()
	getAddon()
	local dat=HS:GetAsync("https://api.trello.com/1/tokens/"..token.."/member"..addon,true)
	print(dat)
	local data=HS:JSONDecode(dat)
	
	return data["idBoards"]
end
--[[
	POST /1/cards/[card id or shortlink]/idLabels
	Required permissions: write
	Arguments
	value (required)
		Valid Values: The id of the label to add
--]]--]]
	function T:AddCardLabel(card,lid)
		local url
		local cardi=tostring(card)
		if Private then
			getAddon()
			url="https://api.trello.com/1/cards/"..cardi.."/idLabels"..addon
		else
			 url="https://api.trello.com/1/cards/"..cardi.."/idLabels"..addon
		end
		--print(card,"IS THE CARD ID \n",lid,"IS THE LABEL ID")
		local da={
			value=lid
		}
		local dat=HS:JSONEncode(da)
		local data=HS:PostAsync(url,dat)
		--print(data)
		return HS:JSONDecode(data)
	end
	--[[
		POST /1/boards
	Required permissions: write
	Arguments
	name (required)
		Valid Values: a string with a length from 1 to 16384
	desc (optional)
		Valid Values: a string with a length from 0 to 16384
	idOrganization (optional)
		Valid Values: The id or name of the organization to add the board to.
	idBoardSource (optional)
		Valid Values: The id of the board to copy into the new board
	keepFromSource (optional)
		Default: all
		Valid Values: Components of the source board to copy.
	powerUps (optional)
		Valid Values: all or a comma-separated list of:
		calendar
		cardAging
		recap
		voting
	prefs_permissionLevel (optional)
		Default: private
		Valid Values: One of:
		org
		private
		public
	prefs_voting (optional)
		Default: disabled
		Valid Values: One of:
		disabled
		members
		observers
		org
		public
	prefs_comments (optional)
		Default: members
		Valid Values: One of:
		disabled
		members
		observers
		org
		public
	prefs_invitations (optional)
		Default: members
		Valid Values: One of:
		admins
		members
	prefs_selfJoin (optional)
		Default: true
		Valid Values:
		true
		false
	prefs_cardCovers (optional)
		Default: true
		Valid Values:
		true
		false
	prefs_background (optional)
		Default: blue
		Valid Values: a string with a length from 0 to 16384
	prefs_cardAging (optional)
		Default: regular
		Valid Values: One of:
		pirate
		regular
	--]]--]]
	function T:AddBoard(nae,dec)
		local url
		if Private then
			getAddon()
			url="https://api.trello.com/1/boards"..addon
		else
			 getAddon()
			 url="https://api.trello.com/1/boards"..addon
		end
		local dat={
			name=nae,
			desc=dec
		}
		local data=HS:JSONEncode(dat)
		local re=HS:PostAsync(url,data)
		local red=HS:JSONDecode(re)
		return red
	end
	function T:GetCardID(name,boardid)
		local url
		if Private then
			getAddon()
			url="https://api.trello.com/1/boards/"..boardid.."/cards"..addon
		else
			 getAddon()
			 url="https://api.trello.com/1/boards/"..boardid.."/cards"..addon
		end
		local tab=HS:GetAsync(url,true)
		local tabl=HS:JSONDecode(tab)
		for k,ta in pairs(tabl) do
			for p,t in pairs(ta) do
				if p=="name" and t==name then
					return ta.id
				end
			end
		end
	end
	function T:GetCardInfo(cardid)
		--/1/boards/[board_id]/cards/[idCard]
		local url
		if Private then
			getAddon()
			url="https://api.trello.com/1/cards/"..cardid..""..addon
		else
		   	 getAddon()
			 url="https://api.trello.com/1/cards/"..cardid..""..addon
		end
		local re=HS:GetAsync(url,true)
		local tab=HS:JSONDecode(re)
		return tab
	end
	function T:GetBoardInfo(boardid)
		local url
		if Private then
			getAddon()
			url="https://api.trello.com/1/boards/"..boardid.."?lists=all&cards=all&card_checklists=all&labels=all&memberships=all&members=all&membersInvited=all&checklists=all&organization_memberships=all&fields=all"..getAddon()
		else
			 getAddon()
			 url="https://api.trello.com/1/boards/"..boardid.."?lists=all&cards=all&card_checklists=all&labels=all&memberships=all&members=all&membersInvited=all&checklists=all&organization_memberships=all&fields=all"..getAddon()
		end
		local re=HS:GetAsync(url,true)
		local data=HS:JSONDecode(re)
		return data
	end
	function T:GetLists(boardid)
		local url
		if Private then
			getAddon()
			url="https://api.trello.com/1/boards/"..boardid.."/lists"..addon
		else
			getAddon()
			url="https://api.trello.com/1/boards/"..boardid.."/lists"..addon
		end
		local re=HS:GetAsync(url,true)
		local data=HS:JSONDecode(re)
		return data
	end
	function T:GetMemberBoards(name)
		local url
		if Private then
			getAddon()
			url="https://api.trello.com/1/members/"..name.."/boards"..addon
		else
			getAddon()
			url="https://api.trello.com/1/members/"..name.."/boards"..addon
		end
		local re=HS:GetAsync(url,true)
		local data=HS:JSONDecode(re)
		return data
	end
	function T:GetBoardMembers(boardid)
		local url
		if Private then
			getAddon()
			url="https://api.trello.com/1/boards/"..boardid.."/members"..addon
		else
			getAddon()
			url="https://api.trello.com/1/boards/"..boardid.."/members"..addon
		end
		local re=HS:GetAsync(url,true)
		local data=HS:JSONDecode(re)
		return data
	end
--[[
		POST /1/boards

Required permissions: write
Arguments Hide
name (required)
Valid Values: a string with a length from 1 to 16384
desc (optional)
Valid Values: a string with a length from 0 to 16384
idOrganization (optional)
Valid Values: The id or name of the organization to add the board to.
idBoardSource (optional)
Valid Values: The id of the board to copy into the new board
keepFromSource (optional)
Default: all
Valid Values: Components of the source board to copy.
powerUps (optional)
Valid Values: all or a comma-separated list of:
calendar
cardAging
recap
voting
prefs_permissionLevel (optional)
Default: private
Valid Values: One of:
org
private
public
prefs_voting (optional)
Default: disabled
Valid Values: One of:
disabled
members
observers
org
public
prefs_comments (optional)
Default: members
Valid Values: One of:
disabled
members
observers
org
public
prefs_invitations (optional)
Default: members
Valid Values: One of:
admins
members
prefs_selfJoin (optional)
Default: true
Valid Values:
true
false
prefs_cardCovers (optional)
Default: true
Valid Values:
true
false
prefs_background (optional)
Default: blue
Valid Values: a string with a length from 0 to 16384
prefs_cardAging (optional)
Default: regular
Valid Values: One of:
pirate
regular
	]]--]]
	function T:CreateBoard(nam,...)
		local opt={...}
		local tab={
			name=nam
		}
		for i,v in next,opt do
			local arg="none"
			if i==1 then
				tab["desc"]=v
			elseif i==2 then
				tab["prefs_permissionLevel"]=v
			end
		end
		local tabl=HS:JSONEncode(tab)
		local ret=HS:PostAsync("https://api.trello.com/1/boards",tabl)
		return HS:JSONDecode(ret)
	end
	function T:GetBoardID(name)
			local url
			if Private then
				getAddon()
				url="https://api.trello.com/1/members/me/boards"..addon
			else
				getAddon()
				url="https://api.trello.com/1/members/me/boards"..addon
			end
			local tball=HS:GetAsync(url,true)
			local dt=HS:JSONDecode(tball)
			for _,tab in pairs(dt) do
				for p,it in pairs(tab) do
					if p=="name" and it==name then
						return tab.id
					end
				end
			end
			error(name.." not found!")
			return nil
		end
	--[[
POST /1/cards
	Required permissions: write
	Arguments
	name (optional)
		Valid Values: The name of the new card. It isn&#39;t required if the name is being copied from provided by a URL, file or card that is being copied.
	desc (optional)
		Valid Values: a string with a length from 0 to 16384
	pos (optional)
		Default: bottom
		Valid Values: A position. top, bottom, or a positive number.
	due (required)
		Valid Values: A date, or null
	labels (optional)
		Valid Values: all or a comma-separated list of:
		blue
		green
		orange
		purple
		red
		yellow
	idList (required)
		Valid Values: id of the list that the card should be added to
	idMembers (optional)
		Valid Values: A comma-separated list of objectIds, 24-character hex strings
	idLabels (optional)
		Valid Values: A comma-separated list of objectIds, 24-character hex strings
	urlSource (required)
		Valid Values: A URL starting with http:// or https:// or null
	fileSource (optional)
		Valid Values: A file
	idCardSource (optional)
		Valid Values: The id of the card to copy into a new card.
	keepFromSource (optional)
		Default: all
		Valid Values: Properties of the card to copy over from the source.

	--]]--]]
	function T:AddCard(...)
		local url
		local args={...}
		local dat=nil
		if #args==3 then
			local nam,des,lid=args[1],args[2],args[3]
			dat={
			name=nam,
			desc=des.."",
			idList=lid,
			urlSource=nil,
			due=nil
			}
		elseif #args==4 then
			local nam,des,lid,url=args[1],args[2],args[3],args[4]
			dat={
			name=nam,
			desc=""..des,
			idList=lid,
			urlSource=url,
			due=nil
			}
		elseif #args==5 then
			local nam,des,lid,url,po=args[1],args[2],args[3],args[4],args[5]
			dat={
			name=nam,
			desc=""..des,
			idList=lid,
			urlSource=url,
			pos=po,
			due=nil
			}
		elseif #args==6 then
			local nam,des,lid,url,po,de=args[1],args[2],args[3],args[4],args[5],args[6]
			dat={
			name=nam,
			desc=""..des,
			idList=lid,
			urlSource=url,
			pos=po,
			due=de
			}
		elseif #args==7 then
			local nam,des,lid,url,po,de,label=args[1],args[2],args[3],args[4],args[5],args[6],args[7]
			dat={
			name=nam,
			desc=""..des,
			idList=lid,
			urlSource=url,
			pos=po,
			due=de,
			labels=label
			}
		elseif #args==8 then
			local nam,des,lid,url,po,de,label,cc=args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8]
			dat={
			name=nam,
			desc=""..des,
			idList=lid,
			urlSource=url,
			pos=po,
			due=de,
			labels=label,
			idCardSource=cc
			}
		end
		local data
		if dat~= nil then
			data=HS:JSONEncode(dat)
		else
			error("No Parameters Found!")
			return false
		end
		if Private then
			getAddon()
			url="https://api.trello.com/1/cards"..addon
		else
			 getAddon()
			 url="https://api.trello.com/1/cards"..addon
		end
		local re=HS:PostAsync(url,data)
		return HS:JSONDecode(re)
	end
	--[[
POST /1/cards
	Required permissions: write
	Arguments
	name (optional)
		Valid Values: The name of the new card. It isn&#39;t required if the name is being copied from provided by a URL, file or card that is being copied.
	desc (optional)
		Valid Values: a string with a length from 0 to 16384
	pos (optional)
		Default: bottom
		Valid Values: A position. top, bottom, or a positive number.
	due (required)
		Valid Values: A date, or null
	labels (optional)
		Valid Values: all or a comma-separated list of:
		blue
		green
		orange
		purple
		red
		yellow
	idList (required)
		Valid Values: id of the list that the card should be added to
	idMembers (optional)
		Valid Values: A comma-separated list of objectIds, 24-character hex strings
	idLabels (optional)
		Valid Values: A comma-separated list of objectIds, 24-character hex strings
	urlSource (required)
		Valid Values: A URL starting with http:// or https:// or null
	fileSource (optional)
		Valid Values: A file
	idCardSource (optional)
		Valid Values: The id of the card to copy into a new card.
	keepFromSource (optional)
		Default: all
		Valid Values: Properties of the card to copy over from the source.

	--]]--]]
	function AddCustomCard(array, ListID)
		if array["due"]==nil then
			array["due"]=nil
		end
		if array["urlSource"]==nil then
			array["urlSource"]=nil
		end
		array["idList"]=ListID
		getAddon()
		local ret=HS:PostAsync("https://api.trello.com/1/cards"..addon, HS:JSONEncode(array))
		local data=HS:JSONDecode(ret)
		return data
	end
	--[[
POST /1/cards/[card id or shortlink]/attachments
	Required permissions: write
	Arguments
	file (optional)
		Valid Values: A file
	url (optional)
		Valid Values: A URL starting with http:// or https:// or null
	name (optional)
		Valid Values: a string with a length from 0 to 256
	mimeType (optional)
		Valid Values: a string with a length from 0 to 256
	--]]--]]
	function T:AddCardAtt(cardid,nae,type,value)
		local url
		local dat
		if string.lower(type)=="file" then
			dat={
				name=nae,
				file=value
			}
		elseif string.lower(type)=="url" then
			dat={
				name=nae,
				url=value
			}
		elseif string.lower(type)=="mime" then
			dat={
				name=nae,
				mimeType=value
			}
		end
		local cardi=tostring(cardid)
		if Private then
			getAddon()
			url="https://api.trello.com/1/cards/"..cardi.."/attachments"..addon
		else
			 getAddon()
			 url="https://api.trello.com/1/cards/"..cardi.."/attachments"..addon
		end
		local data=HS:JSONEncode(dat)
		local re=HS:PostAsync(url,data)
		return re
	end
	--[[
GET /1/boards/[board_id]/labels
Required permissions: read
Arguments
	fields (optional)
		Default: all
		Valid Values: all or a comma-separated list of:
		color
		idBoard
		name
		uses
	limit (optional)
		Default: 50
		Valid Values: a number from 0 to 1000
	--]]--]]
	function T:GetLabels(boardid)
		local url
		local dat
		if Private then
			getAddon()
			url="https://api.trello.com/1/boards/"..boardid.."/labels"..addon
		else
			 getAddon()
			 url="https://api.trello.com/1/boards/"..boardid.."/labels"..addon
		end
		local re=HS:GetAsync(url,true)
		--print(re)
		local dat=HS:JSONDecode(re)
		return dat
	end
		--[[
GET /1/boards/[board_id]/labels
Required permissions: read
Arguments
	fields (optional)
		Default: all
		Valid Values: all or a comma-separated list of:
		color
		idBoard
		name
		uses
	limit (optional)
		Default: 50
		Valid Values: a number from 0 to 1000
	--]]--]]
	function T:GetLabelID(LabelName,boardid)
		local url
		local dat
		if Private then
			getAddon()
			url="https://api.trello.com/1/boards/"..boardid.."/labels"..addon
		else
			 getAddon()
			 url="https://api.trello.com/1/boards/"..boardid.."/labels"..addon
		end
		local re=HS:GetAsync(url,true)
		--print(re)
		local dat=HS:JSONDecode(re)
		local id
		for i,v in next,dat do
			if v.name==LabelName then
				id=v.id
				break
			end
		end
		return id
	end
	
	--[[
	GET /1/boards/[board_id]/lists
		Required permissions: read
		Arguments
		cards (optional)
			Default: none
			Valid Values: One of:
			all
			closed
			none
			open
			visible
		card_fields (optional)
			Default: all
			Valid Values: all or a comma-separated list of:
			badges
			checkItemStates
			closed
			dateLastActivity
			desc
			descData
			due
			email
			idAttachmentCover
			idBoard
			idChecklists
			idLabels
			idList
			idMembers
			idMembersVoted
			idShort
			labels
			manualCoverAttachment
			name
			pos
			shortLink
			shortUrl
			subscribed
			url
		filter (optional)
			Default: open
			Valid Values: One of:
			all
			closed
			none
			open
		fields (optional)
			Default: all
			Valid Values: all or a comma-separated list of:
			closed
			idBoard
			name
			pos
			subscribed
		--]]--]]
	function T:GetListID(name,boardid)
		local url
		if Private then
			getAddon()
			url="https://api.trello.com/1/boards/"..boardid.."/lists"..addon
		else
			 getAddon()
			 url="https://api.trello.com/1/boards/"..boardid.."/lists"..addon
		end
		local tab=HS:GetAsync(url,true)
		local tabl=HS:JSONDecode(tab)
		for k,ta in pairs(tabl) do
			for p,t in pairs(ta) do
				if p=="name" and t==name then
					return ta.id
				end
			end
		end
	end
	--[[
		POST /1/lists
			Required permissions: write
			Arguments
				name (required)
					Valid Values: a string with a length from 1 to 16384
				idBoard (required)
					Valid Values: id of the board that the list should be added to
				idListSource (optional)
					Valid Values: The id of the list to copy into a new list.
				pos (optional)
					Default: top
					Valid Values: A position. top, bottom, or a positive number.
	--]]--]]
	function T:AddList(...)
		local args={...}
		local nam,boid,idsource,po
		local url
		local dat
		if #args==2 then
			nam,boid=args[1],args[2]
			dat={name=nam,idBoard=boid}
		elseif #args==3 then
			nam,boid,idsource=args[1],args[2],args[3]
		 	dat={name=nam,idBoard=boid,idListSource=idsource}
		elseif #args==4 then
			nam,boid,idsource,po=args[1],args[2],args[3],args[4]
			dat={name=nam,idBoard=boid,idListSource=idsource,pos=po}
		else
			error("Invalid arguments: "..table.concat(args,","))
		end
		--	
		if Private then
			getAddon()
			url="https://api.trello.com/1/lists"..addon
		else
			getAddon()
			url="https://api.trello.com/1/lists"..addon
		end
		local data=HS:JSONEncode(dat)
		local re=HS:PostAsync(url,data)
		return re.id
	end
	--[[
	EXAMPLE:
		function cardAdded(card)
			print(card.name)
		end
		local api=require(script.Parent.TrelloAPI) 
		local boardid=api:GetBoardID("TestBoard")--The board id is different from the link you see when you go to a board 
		local listid=api:GetListID("Testing",boardid) 
		api.CardAdded(listid):connect(cardAdded)
		
	--]]
	function T.CardAdded(ListID,RefreshTimeInSecs,initialIteration)
		if RefreshTimeInSecs==nil then
			RefreshTimeInSecs=30
		end
		if initialIteration==nil then
			initialIteration=false
		end
		local Hook={}
		local callbackEnded=false
		local previousTable={}
		if not initialIteration then
			previousTable=T:GetCardsInList(ListID)
		end
		local function refreshCallback(callback)
			local newTable=T:GetCardsInList(ListID)
			print("Is there something added?")
			if (#newTable>#previousTable) then
				print("Something added what is it...")
				for _,i in next,newTable do
					local found=false
					for _,v in next,previousTable do
						if (v.id==i.id) then
							found=true
						end
					end  
					if (not found) then
						callback(i,ListID)
					end
				end
			end
			previousTable=newTable
		end
		local thread=nil
		function Hook:connect(callback)
			thread=coroutine.wrap(function(callbackEndedNested,callbackNested)
				while ((not callbackEndedNested)) do			
					local suc,msg = false,""
					repeat
						suc,msg=pcall(refreshCallback,callbackNested)
					until suc
					wait(RefreshTimeInSecs)
				end
			end)
			thread(callbackEnded,callback)
		end		
		function Hook:disconnect()
			callbackEnded=true
			thread(callbackEnded,function()end)
		end
		return Hook
	end
	
	--[[
		function cardRemoved(card)
			print(card.name)
		end
		local api=require(script.Parent.TrelloAPI) 
		local boardid=api:GetBoardID("TestBoard")--The board id is different from the link you see when you go to a board 
		local listid=api:GetListID("Testing",boardid) 
		api.CardRemoved(listid):connect(cardRemoved)	
	--]]
	function T.CardRemoved(ListID,RefreshTimeInSecs,initialIteration)
		if RefreshTimeInSecs==nil then
			RefreshTimeInSecs=30
		end
		if initialIteration==nil then
			initialIteration=false
		end
		local Hook={}
		local callbackEnded=false
		local previousTable={}
		if not initialIteration then
			previousTable=T:GetCardsInList(ListID)
		end
		local function refreshCallback(callback)
			local newTable=T:GetCardsInList(ListID)
			print("Is there something added?")
			if (#newTable<#previousTable) then
				print("Something added what is it...")
				for _,i in next,newTable do
					local found=false
					for _,v in next,previousTable do
						if (v.id==i.id) then
							found=true
						end
					end  
					if (not found) then
						callback(i,ListID)
					end
				end
			end
			previousTable=newTable
		end
		local thread=nil
		function Hook:connect(callback)
			thread=coroutine.wrap(function(callbackEndedNested,callbackNested)
				while ((not callbackEndedNested)) do			
					local suc,msg = false,""
					repeat
						suc,msg=pcall(refreshCallback,callbackNested)
					until suc
					wait(RefreshTimeInSecs)
				end
			end)
			thread(callbackEnded,callback)
		end		
		function Hook:disconnect()
			callbackEnded=true
			thread(callbackEnded,function()end)
		end
		return Hook
	end
return T