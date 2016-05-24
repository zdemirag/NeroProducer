#!/bin/bash

git cms-init

git cms-addpkg RecoJets/JetProducers
git remote add -f PUJetId https://github.com/jbrands/cmssw.git
git checkout PUJetId/pileupJetId76X -b pileupJetId76X
cd RecoJets/JetProducers/data/
wget https://github.com/jbrands/RecoJets-JetProducers/raw/3dad903ed25d025f68be94d6f781ca957d6f86ac/pileupJetId_76x_Eta0to2p5_BDT.weights.xml.gz
wget https://github.com/jbrands/RecoJets-JetProducers/raw/3dad903ed25d025f68be94d6f781ca957d6f86ac/pileupJetId_76x_Eta2p5to2p75_BDT.weights.xml.gz
wget https://github.com/jbrands/RecoJets-JetProducers/raw/3dad903ed25d025f68be94d6f781ca957d6f86ac/pileupJetId_76x_Eta2p75to3_BDT.weights.xml.gz
wget https://github.com/jbrands/RecoJets-JetProducers/raw/3dad903ed25d025f68be94d6f781ca957d6f86ac/pileupJetId_76x_Eta3to5_BDT.weights.xml.gz
cd ../../..

echo /CommonTools/PileupAlgos/ > .git/info/sparse-checkout
echo /CommonTools/Utils/ >> .git/info/sparse-checkout
echo /JetMETCorrections/Configuration/ >> .git/info/sparse-checkout
echo /JetMETCorrections/Modules/ >> .git/info/sparse-checkout
echo /JetMETCorrections/Type1MET/ >> .git/info/sparse-checkout
echo /PhysicsTools/PatAlgos/ >> .git/info/sparse-checkout
echo /PhysicsTools/PatUtils/ >> .git/info/sparse-checkout
echo /RecoMET/METAlgorithms/ >> .git/info/sparse-checkout
echo /RecoMET/METProducers/ >> .git/info/sparse-checkout
echo /EgammaAnalysis/ElectronTools/ >> .git/info/sparse-checkout
git cms-merge-topic amarini:egcorrection76x
git cms-merge-topic cms-met:metTool76X
git remote add blinkseb https://github.com/blinkseb/cmssw.git
git fetch blinkseb
git cherry-pick 4cca4688ae368bbbef2102e9bdc5bb00f6df959e
git cms-merge-topic amarini:topic_met
git clone git@github.com:zdemirag/NeroProducer.git
