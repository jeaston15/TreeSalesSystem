package transactions;

import impresario.IView;
import javafx.scene.Scene;
import model.Scout;
import userinterface.AddScoutView;
import userinterface.View;

public class ScoutTransaction extends Transaction {

	private String addScoutErrorMessage = "";
	private String addScoutStatusMessage = "";

	private Scout myScout;
	private String transType;

	protected ScoutTransaction(String trans, Object model) throws Exception {
		super(trans, model);
		transType = trans;
		myScout = (Scout) model;

	}

	public void subscribe(String arg0, IView arg1) {
		// TODO Auto-generated method stub

	}

	protected void setDependencies() {
		// TODO Auto-generated method stub

	}

	protected Scene createView() {
		// TODO Auto-generated method stub
		if (transType.equals("AddScout")) {
			Scene currentScene = myViews.get("AddScoutView");
			
			if (currentScene == null) {
				//View newView = new AddScoutView();
			}
		}

		if ((transType.equals("UpdateScout")) || (transType.equals("RemoveScout"))) {
			Scene currentScene = myViews.get("UpdateRemoveScoutView");
		}


		return null;
	}

	public Object getState(String key) {
		// TODO Auto-generated method stub
		return null;
	}

	public void stateChangeRequest(String key, Object value) {
		if (key.equals("AddScout")) {
			
		}

		if (key.equals("UpdateScout")) {
			
		}

		if (key.equals("RemoveScout")) {
	
		}
	}

}
