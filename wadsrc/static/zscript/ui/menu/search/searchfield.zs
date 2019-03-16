//=============================================================================
//
// Option Search Field class.
//
// When the search query is entered, makes Search Menu perform a search.
//
//=============================================================================

class os_SearchField : OptionMenuItemTextField
{
	os_SearchField Init(String label, os_Menu menu, string query)
	{
		Super.Init(label, "");

		mMenu = menu;

		mText = query;

		return self;
	}

	override bool MenuEvent(int mkey, bool fromcontroller)
	{
		if (mkey == Menu.MKEY_Enter)
		{
			Menu.MenuSound("menu/choose");
			mEnter = TextEnterMenu.OpenTextEnter(Menu.GetCurrentMenu(), SmallFont, mText, -1, fromcontroller);
			mEnter.ActivateMenu();
			return true;
		}
		if (mkey == Menu.MKEY_Input)
		{
			string text  = mEnter.GetText();
			let    query = os_Query.fromString(text);

			mMenu.search(query);
		}

		return Super.MenuEvent(mkey, fromcontroller);
	}

	override String Represent()
	{
		return mEnter
			? mEnter.GetText() .. SmallFont.GetCursor()
			: mText;
	}

	private os_Menu mMenu;
	private string  mText;
}
