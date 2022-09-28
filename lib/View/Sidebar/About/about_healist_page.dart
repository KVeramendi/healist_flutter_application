import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Widget/custom_appbar_widget.dart';
import 'package:healist_flutter_application/Widget/custom_elevatebutton_widget.dart';

class AboutHealistPage extends StatelessWidget {
  const AboutHealistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
          appBar: const CustomAppBarWidget(title: 'Sobre Healist'),
          body: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/healist_logo.png', width: 260.0),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0)),
                    const SizedBox(
                        width: double.maxFinite,
                        child: Text(
                            'Healist es una aplicación móvil orientado en la nutrición, que sirve como herramienta de control y seguimiento nutricional. Este aplicativo le brindará toda la información de la ingesta calórica y de macronutrientes (proteínas, carbohidratos y grasas) de los alimentos ingeridos a través de gráficos estadísticos. Además, tendrá al alcance distintas publicaciones de alimentación y estilo de vida saludable para que pueda estar más informados en el campo de la nutrición.',
                            textAlign: TextAlign.justify)),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.0)),
                    CustomElevateButtonWidget(
                        height: 50.0,
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LicensePage(
                                    applicationName: 'Healist',
                                    applicationVersion: '1.0.0',
                                    applicationIcon: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset(
                                            'assets/images/healist_icon.png'))))),
                        backgroundColor: Colors.black87,
                        text: 'Licencias de aplicación',
                        textSize: 20.0)
                  ]))));
}
