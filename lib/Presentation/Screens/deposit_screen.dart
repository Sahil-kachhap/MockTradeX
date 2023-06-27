import 'package:flutter/material.dart';
import 'package:mock_tradex/constants.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdPage {
  RewardedAd? _rewardedAd;
  bool isAdLoaded = false;
  static const String adUnitId = 'ca-app-pub-3940256099942544/5224354917';
  Future<void> loadAd() async {
    await RewardedAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          isAdLoaded = true;
          print('$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          isAdLoaded = false;
          print('RewardedAd failed to load: $error');
        },
      ),
    );
  }

  void showAd(context) {
    _rewardedAd!.show(
      onUserEarnedReward:
          (AdWithoutView adWithoutView, RewardItem rewardItem) async {
        // Reward the user for watching an ad.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("You earned 500\$!"),
            backgroundColor: Colors.green,
          ),
        );
      },
    );
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdShowedFullScreenContent.');
      },
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        isAdLoaded = false;
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        isAdLoaded = false;
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
      },
      onAdImpression: (RewardedAd ad) {
        print('$ad impression occurred.');
      },
    );
  }
}

class Deposit_Screen extends StatefulWidget {
  const Deposit_Screen({Key? key}) : super(key: key);

  @override
  _Deposit_ScreenState createState() => _Deposit_ScreenState();
}

class _Deposit_ScreenState extends State<Deposit_Screen> {
  AdPage adPage = AdPage();

  @override
  void initState() {
    adPage.loadAd();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    adPage._rewardedAd!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kAppBackgroundColour,
        body: Center(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.teal,
            ),
            onPressed: () async {
              adPage.loadAd();
              adPage.showAd(context);
            },
            child: const Text("VIEW AD"),
          ),
        ),
      ),
    );
  }
}
