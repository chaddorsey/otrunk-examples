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

def self.init
  puts "self.init called"
end

def self.clicked
  @button_response = ButtonResponse.new
  @button_response.clicked
end

class ButtonResponse
  $multiOrgViewInternal = $multiOrgView.getComponent(0).getComponent(0)

  def clicked
    puts "Removing All Organisms"
    $multiOrgViewInternal.removeAllOrganisms
    $multiOrgViewInternal.repaint
  end
end
