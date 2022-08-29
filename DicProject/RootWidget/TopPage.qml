import QtQuick 2.9
import QtQuick.Controls 2.5


SwipeView {

    anchors.fill: parent
    id:root

    signal finishedtest();
    function startLearn( lesson)
    {
        learnpage.initlesson(lesson)
    }


    Page
    {
        LearnPage
        {
          id:learnpage
          onClosepage:
          {
              root.visible=false
          }
          onFinishedtest:
          {
            root.finishedtest();
          }
        }
    }



}
