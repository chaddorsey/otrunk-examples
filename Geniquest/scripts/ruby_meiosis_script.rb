require 'java' 
require 'rbconfig'
require 'erb'

include_class 'javax.swing.JOptionPane'

include_class 'org.concord.framework.otrunk.OTrunk'
include_class 'org.concord.biologica.state.OTBreedOffspring'
include_class 'org.concord.biologica.state.OTOrganism'
include_class 'org.concord.biologica.state.OTWorld'
include_class 'org.concord.biologica.state.OTChromosome'
include_class 'org.concord.biologica.state.OTStaticOrganism'
include_class 'org.concord.biologica.state.OTSex'
include_class 'org.concord.otrunk.ui.OTChoiceWithFeedback'
include_class 'org.concord.otrunk.ui.OTText'

import org.concord.biologica
import org.concord.biologica.ui
import org.concord.biologica.engine
import java.lang
import java.beans
include_class 'org.concord.otrunk.view.OTFolderObject'
include_class 'org.concord.biologica.ui.UIProp'
include_class 'org.concord.biologica.engine.EngineProp'

class MeiosisAction
 include java.beans.PropertyChangeListener

 def propertyChange(evt)
   if (evt.getPropertyName == UIProp::SEX_VIEW_MODE)
     case $meiosisViewInternal.getSexViewMode
     when 1 : $meiosisViewInternal.setSexTextVisible(false) # Normal view
     when 2 : $meiosisViewInternal.setSexTextVisible(false) # Viewing mother chromosomes
     when 3 : $meiosisViewInternal.setSexTextVisible(false) # Viewing father chromosomes
     end
   end
 end
end

# displays message in dialog
def showMessage(message)
  JOptionPane.showMessageDialog(nil, message)
end

def self.init
  puts "self.init called"
  $meiosisViewInternal = $meiosisView.getComponent(0)
  $meiosisViewInternal.addPropertyChangeListener MeiosisAction.new
  true
end