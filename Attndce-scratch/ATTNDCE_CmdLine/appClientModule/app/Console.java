package app;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

import dao.AttndceDTO;
import dao.AttndceDTORemote;
import dao.ModuleDTO;
import dao.StudentDTO;

public class Console {

	private final static String EJB_PROMPT = "ejb >> ";
	private final static String EJB_WS_PROMPT = "ejb-ws >> ";
	private static String PROMPT = EJB_PROMPT;
	private static int mode = 0; // 0 -> ejb . 1 -> ejb-ws

	private static void banner() {
		System.out.println("mode [ejb|ejb-ws] \t(set mode)");
		System.out.println("h \t\t\t(help)");
		System.out.println("m \t\t\t(modules)");
		System.out.println("s \t\t\t(students)");
		System.out.println("att [module][week] \t\t(attendance module week)");
		System.out.println("q \t\t\t(quit)");
		return;
	}

	public static void loop(AttndceDTORemote ejb, AttndceDTO ejbws) {
		Scanner scanner = new Scanner(System.in);
		String line;
		List<String> words;
		String command;
		List<String> args;

		for (; true;) {
			try {

				System.out.print(PROMPT);
				line = scanner.nextLine();
				words = new ArrayList<>(Arrays.asList(line.split(" ")));
				command = words.get(0);
				args = words.subList(1, words.size());
				if (command.equals("h")) {
					banner();
				} else if (command.equals("mode")) {
					if (args.size() == 0) {
						// pass.
					} else
						switch (args.get(0)) {
						case "ejb":
							mode = 0;
							PROMPT = EJB_PROMPT;
							break;
						case "ejb-ws":
							mode = 1;
							PROMPT = EJB_WS_PROMPT;
							break;
						default:
							System.err.println("Wrong value");
							break;
						}

				} else if (command.equals("m")) {
					switch (mode) {
					case 0:
						for (ModuleDTO module : ejb.allModules()) {
							System.out.println(module);
						}
						break;
					case 1:
						for (ModuleDTO module : ejbws.allModules()) {
							System.out.println(module);
						}
						break;
					default:
						break;
					}

				}
				else if (command.equals("s")) {
					switch (mode) {
					case 0:
						for (StudentDTO student : ejb.allStudents()) {
							System.out.println(student);
						}
						break;
					case 1:
						for (StudentDTO student : ejbws.allStudents()) {
							System.out.println(student);
						}
						break;
					default:
						break;
					}

				} else if (command.equals("ins")) {
					String title = String.join(" ", args);
					System.out.println("TODO");

					/*
					 * switch (mode) { case 0: { System.out.println(ejb.insertBookDTO(title) +
					 * " inserted"); } break; case 1: {
					 * System.out.println(ejbws.insertBookDTO(title) + " inserted"); } break;
					 * default: break; }
					 */
				} else if (command.equals("q")) {
					break;
				} else {
					System.err.println("Unknown command (press h for help)");
				}

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

		}
	}

}
