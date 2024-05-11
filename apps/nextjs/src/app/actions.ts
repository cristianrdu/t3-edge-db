import "server-only";

import { api } from "~/trpc/server";
import { type GetTasksSchema } from "./validations";

export async function getTasks(input: GetTasksSchema) {
  const { page, per_page, sort, title, status, priority, operator, from, to } =
    input;

  try {
    // Offset to paginate the results
    const offset = (page - 1) * per_page;
    // Column and order to sort by
    // Spliting the sort string by "." to get the column and order
    // Example: "title.desc" => ["title", "desc"]
    // const [column, order] = (sort?.split(".").filter(Boolean) ?? [
    //   "createdAt",
    //   "desc",
    // ]) as [keyof Task | undefined, "asc" | "desc" | undefined];

    // Convert the date strings to Date objects
    // const fromDay = from ? new Date(from) : undefined;
    // const toDay = to ? new Date(to) : undefined;

    // const where: DrizzleWhere<Task> =
    //   !operator || operator === "and"
    //     ? and(
    //         // Filter tasks by title
    //         title
    //           ? filterColumn({
    //               column: tasks.title,
    //               value: title,
    //             })
    //           : undefined,
    //         // Filter tasks by status
    //         !!status
    //           ? filterColumn({
    //               column: tasks.status,
    //               value: status,
    //               isSelectable: true,
    //             })
    //           : undefined,
    //         // Filter tasks by priority
    //         !!priority
    //           ? filterColumn({
    //               column: tasks.priority,
    //               value: priority,
    //               isSelectable: true,
    //             })
    //           : undefined,
    //         // Filter by createdAt
    //         fromDay && toDay
    //           ? and(gte(tasks.createdAt, fromDay), lte(tasks.createdAt, toDay))
    //           : undefined,
    //       )
    //     : or(
    //         // Filter tasks by title
    //         title
    //           ? filterColumn({
    //               column: tasks.title,
    //               value: title,
    //             })
    //           : undefined,
    //         // Filter tasks by status
    //         !!status
    //           ? filterColumn({
    //               column: tasks.status,
    //               value: status,
    //               isSelectable: true,
    //             })
    //           : undefined,
    //         // Filter tasks by priority
    //         !!priority
    //           ? filterColumn({
    //               column: tasks.priority,
    //               value: priority,
    //               isSelectable: true,
    //             })
    //           : undefined,
    //         // Filter by createdAt
    //         fromDay && toDay
    //           ? and(gte(tasks.createdAt, fromDay), lte(tasks.createdAt, toDay))
    //           : undefined,
    //       );

    // Transaction is used to ensure both queries are executed in a single transaction
    // const { data, total } = await db.transaction(async (tx) => {
    //   const data = await tx
    //     .select()
    //     .from(tasks)
    //     .limit(per_page)
    //     .offset(offset)
    //     .where(where)
    //     .orderBy(
    //       column && column in tasks
    //         ? order === "asc"
    //           ? asc(tasks[column])
    //           : desc(tasks[column])
    //         : desc(tasks.id),
    //     );

    //   const total = await tx
    //     .select({
    //       count: count(),
    //     })
    //     .from(tasks)
    //     .where(where)
    //     .execute()
    //     .then((res) => res[0]?.count ?? 0);

    //   return {
    //     data,
    //     total,
    //   };
    // });

    const { issues } = await api.issue.byRepo({
      owner: "steven-tey",
      repo: "novel",
    });
    // const pageCount = Math.ceil(total / per_page);
    return { data: issues, pageCount: 5 };
  } catch (err) {
    return { data: [], pageCount: 0 };
  }
}

// export async function getTaskCountByStatus() {
//   noStore();
//   try {
//     return await db
//       .select({
//         status: tasks.status,
//         count: count(),
//       })
//       .from(tasks)
//       .groupBy(tasks.status)
//       .execute();
//   } catch (err) {
//     return [];
//   }
// }

// export async function getTaskCountByPriority() {
//   noStore();
//   try {
//     return await db
//       .select({
//         priority: tasks.priority,
//         count: count(),
//       })
//       .from(tasks)
//       .groupBy(tasks.priority)
//       .execute();
//   } catch (err) {
//     return [];
//   }
// }