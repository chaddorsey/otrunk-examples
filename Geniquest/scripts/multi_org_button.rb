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
  puts "self.init called2"

  #$meiosisViewInternalContext=context.$meiosisViewComp.getComponent(0)
  #$context=context.getComponentForObject($meiosisViewComp).getComponent(0);
end

def self.clicked
 response_key = {
   :width_retrieved => { :text => "The width was retrieved." },
   :variable_not_set => { :text => "This variable isn't set. Odd, that."},
   :text_visible => { :text => "The text was visible. I'll make it go away." },
   :text_invisible => { :text => "The text was invisible. I'll make it appear."}
 }
 @label_range_response = LabelRangeResponse.new(response_key)
 @label_range_response.clicked
end

class LabelRangeResponse
  $pedigreeViewInternal=$pedigreeView.getComponent(0)
  $multiOrgViewInternal=$multiOrganismView
  attr_reader :response_key
  
  def initialize(response_key)
    @response_key = response_key
  end
  
  def clicked
    puts $pedigreeViewInternal.isOrganismImagesVisible
    $pedigreeViewInternal.setOrganismImagesVisible(true)
    $pedigreeViewInternal.repaint
    puts $pedigreeViewInternal.getNumberOfOrganisms
    pedOrgs=$pedigreeViewInternal.getOrganisms
    selectedOrgs = $pedigreeViewInternal.getSelectionSet
    $multiOrgViewInternal.removeAllOrganisms
    pedOrgs.each {|p| $multiOrgViewInternal.addOrganism(p.getOrganism)}
    $multiOrgViewInternal.updateScrollBars
    $multiOrgViewInternal.setSelectionSet(selectedOrgs)
    

    #oldwidth=$meiosisViewVar.getWidth
    #puts oldwidth
    #$meiosisViewVar.setWidth(oldwidth + 5)
    #momMarkers=$oldMotherObj.getMarkerString
    #momAlleles = $oldMother.getAlleles
    #puts momMarkers
    #puts momAlleles
    #$oldMotherObj.setVisible(false)
    #sexViewMode=$meiosisViewInternal.getSexViewMode
    #puts sexViewMode
    #newnum=sexViewMode.to_i
    #newnum == 5? newnum = 1 : newnum = newnum + 1
    #$meiosisViewInternal.setSexViewMode(newnum)
  end

end

# displays message in dialog
def showMessage(message)
  JOptionPane.showMessageDialog(nil, message)
end