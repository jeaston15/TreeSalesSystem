package views;

import impresario.IModel;
import views.View;

//==============================================================================
public class ViewFactory {

	public static View createView(String viewName, IModel model)
	{
		if (viewName.equals("WelcomeView") == true)
		{
			return new WelcomeView(model);
		}
		
		else if (viewName.equals("TreeLotCoordinatorView") == true)
		{
			return new TreeLotCoordinatorView(model);
		}
		
		else if (viewName.equals("AddScoutView") == true)
		{
			return new AddScoutView(model);
		}
		
		else if (viewName.equals("ScoutChoiceView") == true)
		{
			return new TreeLotCoordinatorView(model);
		}
		
		else if (viewName.equals("ScoutCollectionView") == true)
		{
			return new TreeLotCoordinatorView(model);
		}
		
		else if (viewName.equals("SearchScoutNameView") == true)
		{
			return new TreeLotCoordinatorView(model);
		}
		
		/**
		 * Add other Views
		
		if (viewName.equals("ScoutCollectionView") == true)
		{
			return new TreeLotCoordinatorView(model);
		}
		*/
		else
			return null;
	}
}
