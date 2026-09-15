import 'package:flutter/material.dart';
import '../styles/amigopet_style.dart';
import 'cuidadores_page.dart';

class DetalhesCuidadorPage extends StatelessWidget {
  final Cuidador cuidador;

  const DetalhesCuidadorPage({
    super.key,
    required this.cuidador,
  });

  // ==========================================================
  // ALERT DIALOG
  // ==========================================================

  void _cancelarAgendamento(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Cancelar agendamento?',
          ),

          content: const Text(
            'Tem certeza de que deseja cancelar este agendamento?',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),

            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AmigoPetColors.red,
              ),

              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Agendamento cancelado.',
                    ),
                  ),
                );
              },

              child: const Text(
                'Cancelar',
              ),
            ),
          ],
        );
      },
    );
  }

  // ==========================================================
  // SIMPLE DIALOG
  // ==========================================================

  void _selecionarServico(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text(
            'Tipo de serviço',
          ),

          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
                _mostrarServico(context, 'Passeio');
              },

              child: const ListTile(
                leading: Icon(
                  Icons.directions_walk,
                  color: AmigoPetColors.primary,
                ),
                title: Text('Passeio'),
              ),
            ),

            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
                _mostrarServico(context, 'Hospedagem');
              },

              child: const ListTile(
                leading: Icon(
                  Icons.home_outlined,
                  color: AmigoPetColors.primary,
                ),
                title: Text('Hospedagem'),
              ),
            ),

            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
                _mostrarServico(context, 'Banho e tosa');
              },

              child: const ListTile(
                leading: Icon(
                  Icons.content_cut,
                  color: AmigoPetColors.primary,
                ),
                title: Text('Banho e tosa'),
              ),
            ),
          ],
        );
      },
    );
  }

  void _mostrarServico(
      BuildContext context,
      String servico,
      ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Serviço selecionado: $servico',
        ),
      ),
    );
  }

  // ==========================================================
  // BOTTOM SHEET
  // ==========================================================

  void _maisOpcoes(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),

      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 15,
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                const Padding(
                  padding: EdgeInsets.all(10),

                  child: Align(
                    alignment: Alignment.centerLeft,

                    child: Text(
                      'Mais opções',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor:
                    AmigoPetColors.lightGreen,

                    child: Icon(
                      Icons.share_outlined,
                      color: AmigoPetColors.primary,
                    ),
                  ),

                  title: const Text(
                    'Compartilhar perfil',
                  ),

                  onTap: () {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Perfil pronto para compartilhar.',
                        ),
                      ),
                    );
                  },
                ),

                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFFFEBEE),

                    child: Icon(
                      Icons.flag_outlined,
                      color: AmigoPetColors.red,
                    ),
                  ),

                  title: const Text(
                    'Denunciar',
                  ),

                  onTap: () {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Obrigado. Sua denúncia será analisada.',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ==========================================================
  // TELA
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AmigoPetColors.background,

      appBar: AppBar(
        backgroundColor: AmigoPetColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),

          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'Perfil do cuidador',
          style: AmigoPetStyles.appBarTitle,
        ),

        actions: [
          IconButton(
            tooltip: 'Mais opções',

            icon: const Icon(
              Icons.more_vert_rounded,
            ),

            onPressed: () {
              _maisOpcoes(context);
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          18,
          20,
          18,
          30,
        ),

        child: Column(
          children: [
            // ======================================================
            // PERFIL
            // ======================================================

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),

              child: Column(
                children: [
                  ClipOval(
                    child: Image.network(
                      cuidador.foto,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,

                      errorBuilder: (
                          context,
                          error,
                          stackTrace,
                          ) {
                        return Container(
                          width: 120,
                          height: 120,
                          color: AmigoPetColors.lightGreen,

                          child: const Icon(
                            Icons.person,
                            size: 60,
                            color: AmigoPetColors.primary,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    cuidador.nome,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: AmigoPetColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: AmigoPetColors.orange,
                        size: 21,
                      ),

                      const SizedBox(width: 5),

                      Text(
                        '${cuidador.avaliacao}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(width: 5),

                      Text(
                        '${cuidador.avaliacoes} avaliações',
                        style: const TextStyle(
                          color: AmigoPetColors.textGrey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),

                    decoration: BoxDecoration(
                      color: AmigoPetColors.lightGreen,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Text(
                      cuidador.especialidade,
                      style: const TextStyle(
                        color: AmigoPetColors.darkGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // ======================================================
            // INFORMAÇÕES
            // ======================================================

            Row(
              children: [
                Expanded(
                  child: InfoCard(
                    icon: Icons.location_on_outlined,
                    title: 'Distância',
                    value: cuidador.distancia,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: InfoCard(
                    icon: Icons.workspace_premium_outlined,
                    title: 'Experiência',
                    value: cuidador.experiencia,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // ======================================================
            // SOBRE
            // ======================================================

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  const Text(
                    'Sobre o cuidador',
                    style: AmigoPetStyles.sectionTitle,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    cuidador.descricao,
                    style: const TextStyle(
                      color: AmigoPetColors.textGrey,
                      height: 1.5,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ======================================================
            // TIPO DE SERVIÇO
            // ======================================================

            SizedBox(
              width: double.infinity,

              child: OutlinedButton.icon(
                onPressed: () {
                  _selecionarServico(context);
                },

                icon: const Icon(
                  Icons.pets_outlined,
                ),

                label: const Text(
                  'Tipo de serviço',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: OutlinedButton.styleFrom(
                  foregroundColor:
                  AmigoPetColors.primary,

                  side: const BorderSide(
                    color: AmigoPetColors.primary,
                  ),

                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ======================================================
            // CANCELAR AGENDAMENTO
            // ======================================================

            SizedBox(
              width: double.infinity,

              child: TextButton.icon(
                onPressed: () {
                  _cancelarAgendamento(context);
                },

                icon: const Icon(
                  Icons.cancel_outlined,
                  color: AmigoPetColors.red,
                ),

                label: const Text(
                  'Cancelar agendamento',
                  style: TextStyle(
                    color: AmigoPetColors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// CARD DE INFORMAÇÃO
// ============================================================

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [
          Icon(
            icon,
            color: AmigoPetColors.primary,
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: const TextStyle(
              color: AmigoPetColors.textGrey,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            value,
            style: const TextStyle(
              color: AmigoPetColors.textDark,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
