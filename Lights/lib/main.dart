
import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

void main()
{
  runApp(MaterialApp(home:TorchController()));
}

class TorchController extends StatelessWidget
{
  const TorchController({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Torch Light Example"),),
      body: FutureBuilder<bool>
        (
        future: _isTorchAvailable(context),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot)
        {
          if(snapshot.hasData && snapshot.data!)
          {
            return Column
              (
              children:
              [

                ElevatedButton(onPressed: ()async
                {
                  _enableTorch(context);
                }, child: Text("Enable Torch")),
                ElevatedButton(onPressed: ()
                {

                  _disableTorch(context);
                }, child: Text("Disable Torch")),

              ],

            );
          }
          else if (snapshot.hasData)
          {
            return const Center(
              child: Text('No torch available.'),
            );
          }
          else
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },

      ),
    );
  }

  Future<bool> _isTorchAvailable(BuildContext context)async
  {
    return await TorchLight.isTorchAvailable();
  }

  Future<void> _enableTorch(BuildContext context)async
  {
    await TorchLight.enableTorch();
  }

  Future<void> _disableTorch(BuildContext context)async
  {

    await TorchLight.disableTorch();
  }
}
