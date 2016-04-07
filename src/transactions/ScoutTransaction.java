package transactions;

import java.util.Locale;
import java.util.Properties;

import impresario.IView;
import javafx.scene.Scene;
import models.Scout;
import views.AddScoutView;
import views.View;
import views.ViewFactory;

public class ScoutTransaction extends Transaction {

	private String addScoutErrorMessage = "";
	private String addScoutStatusMessage = "";

	private String transType;

	// ----------------------------------------------------------
	public ScoutTransaction(String trans, Locale locale) throws Exception {
		super(locale);
		transType = trans;
	}

	// ----------------------------------------------------------
	public void subscribe(String arg0, IView arg1) {
		// TODO Auto-generated method stub

	}

	// ----------------------------------------------------------
	protected void setDependencies() {
		dependencies = new Properties();
		dependencies.setProperty("AddScout", "TransactionError");
		dependencies.setProperty("CancelAddScout", "CancelTransaction");
		dependencies.setProperty("UpdateScout", "TransactionError");
		dependencies.setProperty("CancelUpdateScout", "CancelTransaction");
		dependencies.setProperty("RemoveScout", "TransactionError");
		dependencies.setProperty("CancelRemoveScout", "CancelTransaction");
		dependencies.setProperty("Done", "CancelTransaction");

		myRegistry.setDependencies(dependencies);

	}

	// ----------------------------------------------------------
	protected Scene createView() {
		
		if (transType.equals("AddScout")) {
			Scene currentScene = myViews.get("AddScoutView");

			if (currentScene == null) {
				View newView = ViewFactory.createView("AddScoutView", this);
				currentScene = new Scene(newView);
				myViews.put("AddScoutView", currentScene);
				return currentScene;
			} else {
				return currentScene;
			}
		}
		else {
			return null;
		}
	}

	// ----------------------------------------------------------
	public Object getState(String key) {
		if (key.equals("Locale")) {
			return myLocale;
		}

		return null;
	}

	// ----------------------------------------------------------
	public void stateChangeRequest(String key, Object value) {

		if (key.equals("DoYourJob")) {
			doYourJob();
		}

		if (key.equals("AddScout")) {

		}

		if (key.equals("UpdateScout")) {

		}

		if (key.equals("RemoveScout")) {

		}
	}

}
