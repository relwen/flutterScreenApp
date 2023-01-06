import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECConditionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        elevation: 0.0,
        title: Text('CONDITION OF USE', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
                "We expect Flutter's contributors to act professionally and respectfully, and we expect our social spaces to be safe and dignified environments.Specifically: Respect people, their identities, their culture, and their work.Be kind. Be courteous. Be welcoming.Listen. Consider and acknowledge people's points before responding.Should you experience anything that makes you feel unwelcome in Flutter's community, please contact conduct@flutter.dev. We will not tolerate harassment from anyone in Flutter community, even outside of Flutter public communication channels.",
                style: Theme.of(context).textTheme.bodyText2),
            8.height,
            Text(
                "When multiple contributors disagree on the direction for a particular patch or the general direction of the project, the conflict should be resolved by communication. The people who disagree should get together, try to understand each other's points of view, and work to find a design that addresses everyone's concerns. This is usually sufficient to resolve issues. If you cannot come to an agreement, ask for the advice of a more senior member of the team.Be wary of agreement by attrition, where one person argues a point repeatedly until other participants give up in the interests of moving on. This is not conflict resolution, as it does not address everyone's concerns. Be wary of agreement by compromise, where two good competing solutions are merged into one mediocre solution. A conflict is addressed when the participants agree that the final solution is better than all the conflicting proposals. Sometimes the solution is more work than either of the proposals. Embrace the yak shave.",
                style: Theme.of(context).textTheme.bodyText2),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
