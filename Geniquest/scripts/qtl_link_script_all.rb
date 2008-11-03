include_class 'org.concord.otrunk.biologica.OTStaticOrganism'
include_class 'org.concord.otrunk.biologica.OTPedigree'
include_class 'org.concord.otrunk.biologica.OTSex'
include_class 'org.concord.otrunk.ui.OTChoiceWithFeedback'
include_class 'org.concord.otrunk.ui.OTText'

import org.concord.otrunk.biologica
import org.concord.otrunk.biologica.ui
import org.concord.otrunk.biologica.engine
import org.concord.biologica.qtl
import java.lang
import java.beans
include_class 'org.concord.otrunk.view.OTFolderObject'
include_class 'org.concord.biologica.ui.UIProp'
include_class 'org.concord.biologica.engine.EngineProp'

def self.clicked
  puts $thresh99_99.inspect
  puts "Setting Horizontal visible to false."
  puts $thresh99_99.isHorizontalVisible.to_s
  $thresh99_99.setHorizontalVisible(false)
  puts $thresh99_99.isHorizontalVisible.to_s
  #puts $QTLSimulation.inspect
  #puts $QTLGraph.inspect
  ##$confidenceIntervalVector = $QTLSimulation.getConfidenceInterval(1.to_s).to_s
  ##num = 0
  ##puts $confidenceIntervalVector.size
  ##puts "confInt: " + $confidenceIntervalVector[0].to_s
  ##thresh_array=[99,90,35].to_java :double
  ##$thresholdVector = $QTLSimulation.getThresholdValues(thresh_array)
  ##puts $thresholdVector.size
  ##$thresholdAdjusted = $thresholdVector.map{ |v| v+= 5}
  ##$thresholdAdjusted.each {|v| puts v}
  ##For some reason, this seems to be 5 lower than the actual LOD threshold output on the graph
  ##puts "Threshold at 99%: " + $thresholdAdjusted[0].to_s
  #num = 0
  #puts $confidenceIntervalVector.size
  #puts "confInt: " + $confidenceIntervalVector[0].to_s
  
#    num += 1
#  end
  puts
  puts "Inspecting graphs"
  puts "$QTL_graph_99pct.inspect: " + $QTL_graph_99pct.inspect
  $QTLGraphLabels = $QTL_graph_99pct.getLabels.getVector
  puts "99pct Labels: "
  $QTLGraphLabels.each {|l| puts l;}
  puts "Setting horizontal visible to false again: "
  $QTLGraphLabels[0].setHorizontalVisible(false)
  puts "$QTL_graph_99pct_view.getComponent($QTL_graph_99pct).inspect: " + $QTL_graph_99pct_view.getComponent($QTL_graph_99pct).inspect
  $QTL_graph_obj_99pct = $QTL_graph_99pct_view.getComponent($QTL_graph_99pct)
  puts "X scale: " + $QTL_graph_obj_99pct.getXScale.to_s
  puts "Turning off toolbar."
  $QTLGraphables = $QTL_graph_obj_99pct.getObjList.getSelectedObjects
  puts "Object List: "+ $QTLGraphables.inspect
  puts "Vector: " + $QTLGraphables.size.to_s
  

  #$QTLGraph.remove($QTLConfidenceLabels[4])
  $QTLGraphableVector = $QTLGraphables.getVector
  puts "99pct Graphables: "
  puts
  $QTLGraphableVector.each {|o| puts o.inspect}
  puts "99pct Graphables DataStores: "
  puts
  $QTLGraphableVector.each {|o| puts o.getDataStore}
  $QTLDataStoreZero = $QTLGraphableVector[0].getDataStore.getValues
  puts $QTLDataStoreZero.size

  #num = 0
  #while num < $QTLDataStoreZero.size
  #  puts $QTLDataStoreZero.get(num)
  #  num += 1
  #end
  
  
  #$QTLGraphables.each {|g| puts "object: " + g.inspect;} 
  #$thresholdValues=$QTLSimulation.getThresholdValues(90.to_d)
  #$confidenceIntervals=$QTLSimulation.getComponent.getConfidenceInterval(1.to_s)
  #$scores=$QTLSimulation.getComponent.getScores
  
  #puts "Scores: " + $scores
  #puts
  #puts "Threshold Values: " + $thresholdValues
  #puts
  #puts "Confidence Intervals: " + $confidenceIntervals
  def round_to(x)
    (self * 10**x).round.to_f / 10**x
  end
  
  #$textField.text = "Threshold 99%: " + $thresholdAdjusted[0].round_to(2).to_s + "\nThreshold 90%: " + $thresholdAdjusted[1].round_to(2).to_s + "\nThreshold 85%: " + $thresholdAdjusted[2].round_to(2).to_s
end
def self.init
  puts "self.init called!"
end